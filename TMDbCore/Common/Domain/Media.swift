//
//  Media.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

enum Media {
	case movie(Movie)
	case show(Show)
}

extension Media: Decodable {
	private enum CodingKeys: String, CodingKey {
		case mediaType = "media_type"
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let mediaType = try container.decode(String.self, forKey: .mediaType)

		switch mediaType {
		case "movie":
			self = try .movie(Movie(from: decoder))
		case "tv":
			self = try .show(Show(from: decoder))
		default:
			let context = DecodingError.Context(codingPath: [CodingKeys.mediaType],
			                                    debugDescription: "Unknown media type: \(mediaType)")
			throw DecodingError.dataCorrupted(context)
		}
	}
}
