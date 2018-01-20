//
//  PersonDetail.swift
//  TMDbCore
//
//  Created by Carlos on 16/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

struct PersonDetail: Decodable {
    let identifier      : Int64
    let title           : String
    let posterPath      : String?
    let birthdate       : String?
    let biography       : String?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title = "name"
        case posterPath = "profile_path"
        case birthdate = "birthday"
        case biography
    }
}
