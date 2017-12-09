//
//  DetailNavigatorMock.swift
//  TMDbCoreTests
//
//  Created by Guille Gonzalez on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

@testable import TMDbCore

final class DetailNavigatorMock: DetailNavigator {
	private(set) var showDetailCalled = false
	private(set) var showDetailParameters: (Int64, MediaType)?

	func showDetail(withIdentifier identifier: Int64, mediaType: MediaType) {
		showDetailCalled = true
		showDetailParameters = (identifier, mediaType)
	}
}
