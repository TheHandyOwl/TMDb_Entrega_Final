//
//  DetailViewController.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 28/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit
import RxSwift

protocol DetailViewControllerProvider: class {
	func detailViewController(identifier: Int64, mediaType: MediaType) -> UIViewController
}

class DetailViewController: UIViewController {
	// MARK: - Outlets

	@IBOutlet fileprivate var scrollView: UIScrollView!
	@IBOutlet fileprivate var stackView: UIStackView!
	@IBOutlet fileprivate var loadingView: UIActivityIndicatorView!

	// MARK: - Properties

	private let presenter: DetailPresenter
	private let headerPresenter: DetailHeaderPresenter
	private let posterStripPresenter: PosterStripPresenter

	// MARK: - Initialization

	init(presenter: DetailPresenter,
	     headerPresenter: DetailHeaderPresenter,
	     posterStripPresenter: PosterStripPresenter) {
		self.presenter = presenter
		self.headerPresenter = headerPresenter
		self.posterStripPresenter = posterStripPresenter

		super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		presenter.view = self
		presenter.didLoad()
	}
}

extension DetailViewController: DetailView {
	func setLoading(_ loading: Bool) {
		if loading {
			scrollView.isHidden = true
			loadingView.startAnimating()
		} else {
			scrollView.isHidden = false
			loadingView.stopAnimating()
		}
	}

	func update(with sections: [DetailSection]) {
		stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
		sections.forEach { addView(for: $0) }
	}
}

private extension DetailViewController {
	func addView(for section: DetailSection) {
		let view: UIView

		switch section {
		case .header(let header):
			view = headerView(with: header)
		case .about(let title, let detail):
			view = aboutView(withTitle: title, detail: detail)
		case .posterStrip(let title, let items):
			view = posterStrip(withTitle: title, items: items)
		}

		stackView.addArrangedSubview(view)
	}

	func headerView(with header: DetailHeader) -> UIView {
		let headerView = DetailHeaderView.instantiate()
		headerPresenter.present(header: header, in: headerView)

		return headerView
	}

	func aboutView(withTitle title: String, detail: String) -> UIView {
		let aboutView = DetailAboutView.instantiate()
		aboutView.titleLabel.text = title.uppercased()
		aboutView.detailLabel.text = detail

		return aboutView
	}

	func posterStrip(withTitle title: String, items: [PosterStripItem]) -> UIView {
		let posterStripView = PosterStripView.instantiate()
		posterStripView.presenter = posterStripPresenter
		posterStripView.title = title
		posterStripView.items = items

		posterStripView.itemSelected
			.subscribe(onNext: { [weak self] item in
				self?.presenter.didSelect(item: item)
			})
			.disposed(by: posterStripView.disposeBag)

		return posterStripView
	}
}
