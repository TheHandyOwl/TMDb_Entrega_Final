//
//  Genre.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct Genre: Decodable {
	let identifier: Int
	let name: String

	private enum CodingKeys: String, CodingKey {
		case identifier = "id"
		case name
	}
}

extension Genre {
	static func name(forIdentifier identifier: Int) -> String? {
		return Genre.bundled[identifier]?.name
	}

	static func names(forIdentifiers identifiers: [Int]) -> [String] {
		return identifiers.flatMap { Genre.bundled[$0]?.name }
	}
}

private extension Genre {
	static var bundled: [Int: Genre] = {
		class Dummy {}

		let bundle = Bundle(for: Dummy.self)
		let decoder = JSONDecoder()

		guard
			let url = bundle.url(forResource: "genres", withExtension: "json"),
			let data = try? Data(contentsOf: url),
			let genres = try? decoder.decode([Genre].self, from: data) else {
				fatalError("Couldn't load bundled genres")
			}

		var genresByIdentifier: [Int: Genre] = Dictionary(minimumCapacity: genres.count)

		for genre in genres {
			genresByIdentifier.updateValue(genre, forKey: genre.identifier)
		}

		return genresByIdentifier
	}()
}
