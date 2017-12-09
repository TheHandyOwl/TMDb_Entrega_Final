//
//  MovieDetail.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

struct MovieDetail: Decodable {
    let backdropPath: String?
    let identifier: Int64
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let runtime: Int
    let title: String
    let credits: Credits?
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case identifier = "id"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case title
        case credits
    }
}
