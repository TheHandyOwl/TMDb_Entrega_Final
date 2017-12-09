//
//  PosterStripCell.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 28/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit
import RxSwift

final class PosterStripCell: UICollectionViewCell, ReusableView, NibLoadableView {
	// MARK: - Outlets

	@IBOutlet var posterView: UIImageView!
	@IBOutlet var titleLabel: UILabel!
	@IBOutlet var metadataLabel: UILabel!

	// MARK: - Properties

	private(set) var disposeBag = DisposeBag()

	// MARK: - Overrides

	override func prepareForReuse() {
		super.prepareForReuse()
		posterView.image = nil
		disposeBag = DisposeBag()
	}
}
