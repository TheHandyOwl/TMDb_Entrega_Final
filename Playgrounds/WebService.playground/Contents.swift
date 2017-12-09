@testable import TMDbCore

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly(navigationController: UINavigationController())
let webService = assembly.webServiceAssembly.webService


let apiURL = URL(string: "https://randomuser.me/api/3")!
let endpoint = Endpoint.configuration
let urlRequest = endpoint.request(with: apiURL, adding: ["api_key" : "fistro"])
print("""
    urlRequest: \(urlRequest)
    Verbo: \(urlRequest.httpMethod ?? "")
    """)


// Load configuration

webService.load(Configuration.self, from: .configuration)
	.subscribe(onNext: { print($0.images.baseURL) })
	.disposed(by: disposeBag)
