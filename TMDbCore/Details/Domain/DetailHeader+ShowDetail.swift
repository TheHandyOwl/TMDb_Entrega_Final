//
//  DetailHeader+ShowDetail.swift
//  TMDbCore
//
//  Created by Carlos on 9/12/17.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

extension DetailHeader {
    init(show: ShowDetail, dateFormatter: DateFormatter) {
        title = show.title
        posterPath = show.posterPath
        backdropPath = show.backdropPath
        
        let firstAirDate = show.firstAirDate.flatMap { dateFormatter.date(from: $0) } // con .map obtendríamos un opcional-opcional de date
        let year = (firstAirDate?.year).map { String($0) } // Con el paréntesis se devuelve un opcional, de manera que no se trabaja sobre el entero sino con la cadena que se devuelve
        let duration = "\(show.runtime[0]) min."
        
        metadata = [year, duration].flatMap { $0 }.joined(separator: " - ")
    }
}
