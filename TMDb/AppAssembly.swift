//
//  AppAssembly.swift
//  TMDb
//
//  Created by Guille Gonzalez on 06/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit
import TMDbCore

final class AppAssembly {
	private(set) lazy var window = UIWindow(frame: UIScreen.main.bounds)
	private(set) lazy var navigationController = UINavigationController()
	private(set) lazy var coreAssembly = CoreAssembly(navigationController: navigationController)
}
