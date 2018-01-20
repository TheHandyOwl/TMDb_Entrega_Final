//
//  DetailHeader+PersonDetail.swift
//  TMDbCore
//
//  Created by Carlos on 16/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(person: PersonDetail, dateFormatter: DateFormatter) {
        title = person.title
        posterPath = person.posterPath
        backdropPath = person.posterPath
        
        let birthdate = person.birthdate.flatMap { dateFormatter.date(from: $0)}
        let year = (birthdate?.year).map { String($0) }
        let month = (birthdate?.month).map { String($0) }
        let day = (birthdate?.day).map { String($0) }
        
        metadata = "Birthdate: " + [day, month, year].flatMap { $0 }.joined(separator: "/")
        
    }
}
