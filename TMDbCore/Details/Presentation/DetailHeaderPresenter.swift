//
//  DetailHeaderPresenter.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 30/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift
import RxCocoa

final class DetailHeaderPresenter {
	private let imageRepository: ImageRepositoryProtocol

	init(imageRepository: ImageRepositoryProtocol) {
		self.imageRepository = imageRepository
	}

	func present(header: DetailHeader, in view: DetailHeaderView) {
		bindBackdrop(at: header.backdropPath, to: view)
		bindPoster(at: header.posterPath, to: view)

		view.titleLabel.text = header.title.uppercased()
		view.metadataLabel.text = header.metadata
	}
}

private extension DetailHeaderPresenter {
	func bindBackdrop(at path: String?, to view: DetailHeaderView) {
		guard let path = path else {
			return
		}

		imageRepository.image(at: path, size: .w780)
			.observeOn(MainScheduler.instance)
			.bind(to: view.backdropView.rx.image)
			.disposed(by: view.disposeBag)
	}

	func bindPoster(at path: String?, to view: DetailHeaderView) {
		guard let path = path else {
			return
		}

		imageRepository.image(at: path, size: .w300)
			.observeOn(MainScheduler.instance)
			.bind(to: view.posterView.rx.image)
			.disposed(by: view.disposeBag)
	}
}
