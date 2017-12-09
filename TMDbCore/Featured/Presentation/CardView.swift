//
//  CardView.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 27/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit
import RxSwift

final class CardView: UIView, NibLoadableView {
	private enum Constants {
		static let height: CGFloat = 176
	}

	// MARK: - Outlets

	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var metadataLabel: UILabel!
	@IBOutlet var backdropView: UIImageView!
	@IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!

	// MARK: - Properties

	let disposeBag = DisposeBag()

	// MARK: - Overrides

	// MARK: - Overrides

	override var intrinsicContentSize: CGSize {
		return CGSize(width: UIViewNoIntrinsicMetric, height: Constants.height)
	}
}
