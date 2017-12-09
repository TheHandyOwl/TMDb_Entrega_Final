//
//  PosterStripView.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 28/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class PosterStripView: UIView, NibLoadableView {
	private enum Constants {
		static let height: CGFloat = 218
	}

	// MARK: - Outlets

	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var collectionView: UICollectionView!

	// MARK: - Properties

	var title: String {
		get { return titleLabel.text ?? "" }
		set { titleLabel.text = newValue.uppercased() }
	}

	var presenter: PosterStripPresenter?

	var items: [PosterStripItem] {
		get { return _items.value }
		set { _items.value = newValue }
	}

	var itemSelected: ControlEvent<PosterStripItem> {
		return collectionView.rx.modelSelected(PosterStripItem.self)
	}

	let disposeBag = DisposeBag()

	private let _items = Variable<[PosterStripItem]>([])

	// MARK: - Overrides

	override func awakeFromNib() {
		super.awakeFromNib()

		// Register the cell
		collectionView.register(PosterStripCell.self)

		// Bind the items to the collection view data source
		_items.asObservable()
			.bind(to: collectionView.rx.items) { [weak self] collectionView, index, item in
				let cell = collectionView.dequeueReusableCell(PosterStripCell.self, for: index)
				self?.presenter?.present(item: item, in: cell)

				return cell
			}
			.disposed(by: disposeBag)
	}

	override var intrinsicContentSize: CGSize {
		return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
	}
}
