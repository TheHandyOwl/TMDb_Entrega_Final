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
    let name            : String
    let profilePath     : String?
    let birthdate       : String?
    let biography       : String?
    let credits         : Filmography?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
        case profilePath = "profile_path"
        case birthdate = "birthday"
        case biography
        case credits = "combined_credits"
    }
}
