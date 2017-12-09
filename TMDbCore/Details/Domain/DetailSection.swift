//
//  DetailSection.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 30/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct DetailHeader {
	let title: String
	let metadata: String
	let posterPath: String?
	let backdropPath: String?
}

struct PosterStripItem {
	let identifier: Int64
	let mediaType: MediaType

	let title: String
	let metadata: String
	let posterPath: String?
}

enum DetailSection {
	case header(DetailHeader)
	case about(title: String, detail: String)
	case posterStrip(title: String, items: [PosterStripItem])
}
