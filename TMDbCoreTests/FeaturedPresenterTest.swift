//
//  FeaturedPresenterTest.swift
//  TMDbCoreTests
//
//  Created by Guille Gonzalez on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import XCTest
@testable import TMDbCore

class FeaturedPresenterTest: XCTestCase {
	var sut: FeaturedPresenter!

	// Collaborators
	var detailNavigatorMock: DetailNavigatorMock!
	var featuredRepositoryMock: FeaturedRepositoryMock!

    override func setUp() {
        super.setUp()

        detailNavigatorMock = DetailNavigatorMock()
		featuredRepositoryMock = FeaturedRepositoryMock()
		sut = FeaturedPresenter(detailNavigator: detailNavigatorMock,
		                        repository: featuredRepositoryMock)
    }
    
    func testFeaturedPresenter_didSelectShow_navigatesToShow() {
        // Given
		let show = Show(identifier: 42,
		                title: "Test",
		                posterPath: nil,
		                backdropPath: nil,
		                firstAirDate: nil,
		                genreIdentifiers: nil)

		// When
		sut.didSelect(show: show)

		// Then
		XCTAssertTrue(detailNavigatorMock.showDetailCalled)

		let (identifier, mediaType) = detailNavigatorMock.showDetailParameters!
		XCTAssertEqual(42, identifier)
		XCTAssertEqual(.show, mediaType)
    }
}
