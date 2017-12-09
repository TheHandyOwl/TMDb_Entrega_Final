//
//  FeaturedRepository.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 08/10/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol FeaturedRepositoryProtocol {
    func moviesNowPlaying(region: String) -> Observable<[Movie]>
    func showsOnTheAir() -> Observable<[Show]>
}

final class FeaturedRepository: FeaturedRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func moviesNowPlaying(region: String) -> Observable<[Movie]> {
        return webService.load(Page<Movie>.self, from: .moviesNowPlaying(region: region, page: 1))
            .map { $0.results }
    }
    
    func showsOnTheAir() -> Observable<[Show]> {
        return webService.load(Page<Show>.self, from: .showsOnTheAir(page: 1))
            .map { $0.results }
    }
}
