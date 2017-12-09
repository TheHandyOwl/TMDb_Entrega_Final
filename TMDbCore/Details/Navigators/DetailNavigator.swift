//
//  DetailNavigator.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 07/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

protocol DetailNavigator {
	func showDetail(withIdentifier identifier: Int64, mediaType: MediaType)
}
