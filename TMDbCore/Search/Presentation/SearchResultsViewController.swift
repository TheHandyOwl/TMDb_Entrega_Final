//
//  SearchResultsViewController.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import RxSwift
import RxCocoa

protocol SearchResultsViewControllerProvider: class {
	func searchResultsViewController() -> SearchResultsViewController
}

/// Displays search results
class SearchResultsViewController: UITableViewController {

	// MARK: - Properties

	private let presenter: SearchResultsPresenter
	private let resultPresenter: SearchResultPresenter
	private let disposeBag = DisposeBag()

	// MARK: - Initialization

	init(presenter: SearchResultsPresenter, resultPresenter: SearchResultPresenter) {
		self.presenter = presenter
		self.resultPresenter = resultPresenter
		super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
		bindPresenters()
    }
}

// MARK: - UISearchResultsUpdating

extension SearchResultsViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		// Update the search query as the user types
		presenter.query.value = searchController.searchBar.text ?? ""
	}
}

// MARK: - Private

private extension SearchResultsViewController {
	enum Constants {
		static let separatorInset = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 0)
		static let rowHeight: CGFloat = 88
	}

	func setupView() {
		tableView.register(SearchResultCell.self)

		tableView.separatorInset = Constants.separatorInset
		tableView.rowHeight = Constants.rowHeight
	}

	func bindPresenters() {
		// Bind the search results to the table view data source
		presenter.searchResults
			.bind(to: tableView.rx.items) { [weak self] tableView, index, searchResult in
				let cell = tableView.dequeueReusableCell(SearchResultCell.self)
				self?.resultPresenter.present(searchResult: searchResult, in: cell)

				return cell
			}
			.disposed(by: disposeBag)

		// Tell the presenter when a search result has been selected
		tableView.rx
			.modelSelected(SearchResult.self)
			.subscribe(onNext: { [weak self] result in
				self?.presenter.didSelect(searchResult: result)
			})
			.disposed(by: disposeBag)
	}
}
