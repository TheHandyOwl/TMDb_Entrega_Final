@testable import TMDbCore

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let assembly = CoreAssembly(navigationController: UINavigationController())
let featuredViewController = assembly.featuredAssembly.viewController()

featuredViewController.view.frame = CGRect(x: 0, y: 0, width: 375, height: 667)

PlaygroundPage.current.liveView = featuredViewController
