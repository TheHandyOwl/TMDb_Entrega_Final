//
//  ShowDetail.swift
//  TMDbCore
//
//  Created by Carlos on 9/12/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct ShowDetail: Decodable {
    let identifier          : Int64
    let title               : String
    let posterPath          : String?
    let backdropPath        : String?
    let firstAirDate        : String?
    let genreIdentifiers    : String?
    let runtime             : [Int]
    let overview            : String?
    let credits             : Credits?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title = "name"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIdentifiers = "genre_ids"
        case runtime = "episode_run_time"
        case overview
        case credits
    }
}
