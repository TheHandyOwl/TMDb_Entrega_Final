//
//  Page.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 07/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct Page<T: Decodable>: Decodable {
	let page: Int
	let totalPages: Int
	let totalResults: Int
	let results: [T]

	private enum CodingKeys: String, CodingKey {
		case page
		case totalPages = "total_pages"
		case totalResults = "total_results"
		case results
	}
}
