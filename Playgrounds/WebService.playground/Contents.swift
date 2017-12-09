@testable import TMDbCore

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly()
let webService = assembly.webServiceAssembly.webService

// Load configuration

webService.load(Configuration.self, from: .configuration)
	.subscribe(onNext: { print($0.images.baseURL) })
	.disposed(by: disposeBag)
