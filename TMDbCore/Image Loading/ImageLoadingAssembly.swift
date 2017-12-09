//
//  ImageLoadingAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation
import Kingfisher

final class ImageLoadingAssembly {
	private(set) lazy var imageRepository: ImageRepositoryProtocol = ImageRepository(webService: webServiceAssembly.webService,
	                                                                                 imageManager: KingfisherManager.shared)
	private let webServiceAssembly: WebServiceAssembly

	init(webServiceAssembly: WebServiceAssembly) {
		self.webServiceAssembly = webServiceAssembly
	}
}
