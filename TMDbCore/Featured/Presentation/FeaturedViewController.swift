//
//  FeaturedViewController.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class FeaturedViewController: UIViewController {
	// MARK: - Outlets

	@IBOutlet private var showsLabel: UILabel!
	@IBOutlet private var showsStackView: UIStackView!
	@IBOutlet private var moviesLabel: UILabel!
	@IBOutlet private var moviesStackView: UIStackView!
    @IBOutlet private var personsLabel: UILabel!
    @IBOutlet private var personsStackView: UIStackView!
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var loadingView: UIActivityIndicatorView!

	// MARK: - Properties

	private let presenter: FeaturedPresenter
	private let cardPresenter: CardPresenter
	private let searchNavigator: SearchNavigator
	private let disposeBag = DisposeBag()

	// MARK: - Initialization

	init(presenter: FeaturedPresenter,
	     cardPresenter: CardPresenter,
	     searchNavigator: SearchNavigator) {
		self.presenter = presenter
		self.cardPresenter = cardPresenter
		self.searchNavigator = searchNavigator

		super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

		searchNavigator.installSearch(viewController: self)
        presenter.view = self
		presenter.didLoad()
    }
}

extension FeaturedViewController: FeaturedView {

    func setLoading(_ loading: Bool) {
        if loading {
            scrollView.isHidden = true
            loadingView.isHidden = false
            loadingView.startAnimating()
        } else {
            scrollView.isHidden = false
            loadingView.stopAnimating()
            loadingView.isHidden = true
        }
    }

	func setShowsHeaderTitle(_ title: String) {
		showsLabel.text = title
	}

	func setMoviesHeaderTitle(_ title: String) {
		moviesLabel.text = title
	}
    
    func setPeopleHeaderTitle(_ title: String) {
        personsLabel.text = title
    }

	func update(with shows: [Show]) {
		showsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

		let cardViews: [UIView] = shows.map { show in
			let cardView = CardView.instantiate()
			cardPresenter.present(show: show, in: cardView)
			cardView.tapGestureRecognizer.rx.event
				.subscribe(onNext: { [weak self] _ in
					self?.presenter.didSelect(show: show)
				})
				.disposed(by: disposeBag)

			return cardView
		}

		cardViews.forEach { showsStackView.addArrangedSubview($0) }
	}

	func update(with movies: [Movie]) {
		moviesStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

		let cardViews: [UIView] = movies.map { movie in
			let cardView = CardView.instantiate()
			cardPresenter.present(movie: movie, in: cardView)
			cardView.tapGestureRecognizer.rx.event
				.subscribe(onNext: { [weak self] _ in
					self?.presenter.didSelect(movie: movie)
				})
				.disposed(by: disposeBag)

			return cardView
		}

		cardViews.forEach { moviesStackView.addArrangedSubview($0) }
	}
    
    func update(with persons: [Person]) {
        personsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        let cardViews: [UIView] = persons.map { person in
            let cardView = CardView.instantiate()
            cardPresenter.present(person: person, in: cardView)
            cardView.tapGestureRecognizer.rx.event
                .subscribe(onNext: { [weak self] _ in
                    self?.presenter.didSelect(person: person)
                })
                .disposed(by: disposeBag)
            
            return cardView
        }
        
        cardViews.forEach { personsStackView.addArrangedSubview($0) }
    }
}
