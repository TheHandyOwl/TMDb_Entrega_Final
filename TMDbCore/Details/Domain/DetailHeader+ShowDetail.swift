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
        
        let firstAirDate = show.firstAirDate.flatMap { dateFormatter.date(from: $0) }
        let year = (firstAirDate?.year).map { String($0) }
        let duration = "\(show.runtime[0]) min."
        
        metadata = [year, duration].flatMap { $0 }.joined(separator: " - ")
    }
}
