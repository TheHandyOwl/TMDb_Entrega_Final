//
//  PosterStripItem+CastMember.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension PosterStripItem {
	init(castMember: Credits.CastMember) {
		identifier = castMember.identifier
		mediaType = .person
		title = castMember.name
		metadata = castMember.character
		posterPath = castMember.profilePath
	}
}
