//
//  Person.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct Person: Decodable {
	let identifier: Int64
	let name: String
	let profilePath: String?
	let knownFor: [Media]?

	private enum CodingKeys: String, CodingKey {
		case identifier = "id"
		case name
		case profilePath = "profile_path"
		case knownFor = "known_for"
	}
}
