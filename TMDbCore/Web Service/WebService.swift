//
//  WebService.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 21/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

internal enum WebServiceError: Error {
	case badStatus(Int, Data)
	case api(Int, String)
}

private struct Status: Decodable {
	let code: Int
	let message: String

	enum CodingKeys: String, CodingKey {
		case code = "status_code"
		case message = "status_message"
	}
}

final internal class WebService {
	private let configuration: WebServiceConfiguration
	private let session = URLSession(configuration: .default)
	private let baseURL = URL(string: "https://api.themoviedb.org/3")!
	private let decoder = JSONDecoder()

	init(configuration: WebServiceConfiguration) {
		self.configuration = configuration
	}

	func load<T: Decodable>(_ type: T.Type, from endpoint: Endpoint) -> Observable<T> {
		let decoder = self.decoder
		let request = endpoint.request(with: baseURL, adding: configuration.parameters)

		return session.rx.data(request: request)
			.map { try decoder.decode(T.self, from: $0) }
			.catchError { error in
				guard let webServiceError = error as? WebServiceError else {
					throw error
				}

				guard case let .badStatus(_, data) = webServiceError else {
					throw error
				}

				guard let status = try? decoder.decode(Status.self, from: data) else {
					throw error
				}

				throw WebServiceError.api(status.code, status.message)
			}
	}
}

private extension Reactive where Base: URLSession {
	func data(request: URLRequest) -> Observable<Data> {
		return Observable.create { observer in
			let task = self.base.dataTask(with: request) { data, response, error in
				if let error = error {
					observer.onError(error)
				} else {
					guard let httpResponse = response as? HTTPURLResponse else {
						fatalError("Unsupported protocol")
					}

					if 200 ..< 300 ~= httpResponse.statusCode {
						if let data = data {
							observer.onNext(data)
						}
						observer.onCompleted()
					} else {
						observer.onError(WebServiceError.badStatus(httpResponse.statusCode, data ?? Data()))
					}
				}
			}

			task.resume()

			return Disposables.create {
				task.cancel()
			}
		}
	}
}
