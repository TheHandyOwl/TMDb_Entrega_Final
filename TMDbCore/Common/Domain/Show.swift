//
//  Show.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct Show: Decodable {
	let identifier: Int64
	let title: String
	let posterPath: String?
	let backdropPath: String?
	let firstAirDate: String?
	let genreIdentifiers: [Int]?

	private enum CodingKeys: String, CodingKey {
		case identifier = "id"
		case title = "name"
		case posterPath = "poster_path"
		case backdropPath = "backdrop_path"
		case firstAirDate = "first_air_date"
		case genreIdentifiers = "genre_ids"
	}
}
