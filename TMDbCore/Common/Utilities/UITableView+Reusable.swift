import UIKit

extension UITableView {
	func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
		register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
	}

	func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
		let bundle = Bundle(for: T.self)
		let nib = UINib(nibName: T.nibName, bundle: bundle)

		register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
	}

	func dequeueReusableCell<T: UITableViewCell>(_: T.Type) -> T where T: ReusableView {
		guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier) as? T else {
			fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
		}

		return cell
	}

	func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T where T: ReusableView {
		guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
			fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
		}
		
		return cell
	}

	func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for row: Int) -> T where T: ReusableView {
		return dequeueReusableCell(T.self, for: IndexPath(row: row, section: 0))
	}
}
