//: Playground - noun: a place where people can play

import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum APIError: Error {
	case invalidKey
	case notAnImage
}

struct UserResponse: Decodable {
	struct User: Decodable {
		struct Name: Decodable {
			let title: String
			let first: String
			let last: String
		}

		struct Picture: Decodable {
			let large: URL
		}

		let name: Name
		let picture: Picture
	}

	let results: [User]
}


let empty = Observable<Int>.empty()
let single = Observable.just("Hello")
let some = Observable.from(["🤔", "🤡"])
let error = Observable<Data>.error(APIError.invalidKey)

let hello = Observable<String>.create { observer in
	observer.onNext("Hello")
	observer.onNext("World")
	observer.onCompleted()

	return Disposables.create()
}

let d = hello.subscribe { event in
	switch event {
	case .next(let value):
		print(value)
	case .error(let error):
		print(error)
	case .completed:
		print("completed")
	}
}
d.dispose()

let session = URLSession(configuration: .default)
let apiURL = URL(string: "https://randomuser.me/api")!
let decoder = JSONDecoder()

func data(with url: URL) -> Observable<Data> {
	return Observable<Data>.create { observer in
		let task = session.dataTask(with: url) { data, _, error in
			if let error = error {
				observer.onError(error)
			} else {
				observer.onNext(data ?? Data())
				observer.onCompleted()
			}
		}

		task.resume()

		return Disposables.create {
			print("cancelled")
			task.cancel()
		}
	}
}

func randomUser() -> Observable<UserResponse> {
	return data(with: apiURL).map { data in
		try decoder.decode(UserResponse.self, from: data)
	}
}

func image(with url: URL) -> Observable<UIImage> {
	return data(with: url).map {
		guard let image = UIImage(data: $0) else {
			throw APIError.notAnImage
		}

		return image
	}
}

let disposeBag = DisposeBag()

randomUser()
	.map { userResponse in
		userResponse.results[0]
	}
	.flatMap { user in
		return image(with: user.picture.large)
	}
	.observeOn(MainScheduler.instance)
	.subscribe(onNext: {
		let image = $0
		print(image)
	}, onError: { error in
		print(error)
	})
	.disposed(by: disposeBag)

let cell = UITableViewCell()
let size = cell.imageView?.image?.size
let size2 = cell.imageView.flatMap { $0.image }.flatMap { $0.size }

//disposable.dispose()

