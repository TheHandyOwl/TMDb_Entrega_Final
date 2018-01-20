//
//  PosterStripItem+FilmographyWorksIn.swift
//  TMDbCore
//
//  Created by Carlos on 20/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

extension PosterStripItem {
    init(worksIn: Filmography.WorksIn) {
        identifier = worksIn.identifier
        
        var movieOrTV = ""
        if worksIn.mediaType == "tv" {
            mediaType = .show
            movieOrTV = worksIn.mediaType.uppercased()
        } else {
            mediaType = .movie
            movieOrTV = worksIn.mediaType.capitalized
        }
        
        title = worksIn.title ?? worksIn.name ?? ""
        let votes = worksIn.voteAverage?.description ?? ""
        metadata = "\(movieOrTV): \(votes)"
        posterPath = worksIn.posterPath
    }
}
