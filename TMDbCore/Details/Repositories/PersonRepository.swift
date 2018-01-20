//
//  PersonRepository.swift
//  TMDbCore
//
//  Created by Carlos on 16/1/18.
//  Copyright © 2018 Guille Gonzalez. All rights reserved.
//

import RxSwift

protocol PersonRepositoryProtocol {
    func person(withIdentifier identifier: Int64) -> Observable<PersonDetail>
}

final class PersonRepository: PersonRepositoryProtocol {
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func person(withIdentifier identifier: Int64) -> Observable<PersonDetail> {
        return webService.load(PersonDetail.self, from: .person(identifier: identifier))
    }
}
