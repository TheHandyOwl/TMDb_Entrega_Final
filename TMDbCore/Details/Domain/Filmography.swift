//
//  Filmography.swift
//  TMDbCore
//
//  Created by Carlos on 20/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct Filmography: Decodable {
    struct WorksIn: Decodable {
        let identifier: Int64
        let posterPath: String?
        let title: String?
        let name: String?
        let mediaType: String
        let voteAverage: Float?
        
        private enum CodingKeys: String, CodingKey {
            case identifier = "id"
            case title
            case name
            case mediaType = "media_type"
            case posterPath = "poster_path"
            case voteAverage = "vote_average"
        }
    }
    
    let cast: [WorksIn]
}

