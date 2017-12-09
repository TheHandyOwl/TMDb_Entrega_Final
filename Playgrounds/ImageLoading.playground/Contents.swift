@testable import TMDbCore
import Kingfisher

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly(navigationController: UINavigationController())

let imageRepository = assembly.imageLoadingAssembly.imageRepository

imageRepository.image(at: "ncEmkHADNggjR0dlerOIHqmiY0O.jpg", size: .w300)
	.subscribe(onNext: {
		let image = $0
		print(image)
	})
	.disposed(by: disposeBag)
