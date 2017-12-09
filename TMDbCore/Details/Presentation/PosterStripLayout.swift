//
//  PosterStripLayout.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 28/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import UIKit

final class PosterStripLayout: UICollectionViewFlowLayout {
	private enum Constants {
		static let itemSize = CGSize(width: 96, height: 186)
		static let minimumLineSpacing: CGFloat = 16
		static let sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
	}

	override func prepare() {
		guard let collectionView = collectionView else {
			return
		}

		collectionView.showsHorizontalScrollIndicator = false
		collectionView.scrollsToTop = false

		scrollDirection = .horizontal
		itemSize = Constants.itemSize
		minimumLineSpacing = Constants.minimumLineSpacing
		sectionInset = Constants.sectionInset
	}

	override func targetContentOffset(
		forProposedContentOffset proposedContentOffset: CGPoint,
		withScrollingVelocity velocity: CGPoint) -> CGPoint {

		guard let collectionView = collectionView else {
			return proposedContentOffset
		}

		// When scrolling we want the collection view to snap to item boundaries

		let targetRect = CGRect(origin: CGPoint(x: proposedContentOffset.x, y: 0), size: collectionView.bounds.size)

		guard let attributes = layoutAttributesForElements(in: targetRect) else {
			return proposedContentOffset
		}

		// Iterate through all the visible items to find the closest to the proposed content offset,
		// then adjust the proposed offset to be the origin of that item

		var offsetAdjustment = CGFloat.greatestFiniteMagnitude

		for itemAttributes in attributes {
			if itemAttributes.representedElementCategory != .cell {
				continue
			}

			let x = itemAttributes.frame.origin.x

			if abs(x - proposedContentOffset.x) < abs(offsetAdjustment) {
				offsetAdjustment = x - proposedContentOffset.x
			}
		}

		return CGPoint(x: proposedContentOffset.x + offsetAdjustment - sectionInset.left, y: proposedContentOffset.y)
	}
}
