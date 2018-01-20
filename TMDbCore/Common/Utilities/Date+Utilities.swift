import Foundation

extension Date {
	var year: Int {
		return Calendar.autoupdatingCurrent.component(.year, from: self)
	}
        
    var month: Int {
        return Calendar.autoupdatingCurrent.component(.month, from: self)
    }
    
    var day: Int {
        return Calendar.autoupdatingCurrent.component(.day, from: self)
    }

	var beginningOfDay: Date {
		let calendar = Calendar.autoupdatingCurrent
		let components = calendar.dateComponents([.year, .month, .day], from: self)

		return calendar.date(from: components)!
	}

	func adding(weeks: Int) -> Date {
		return Calendar.autoupdatingCurrent.date(byAdding: .weekOfMonth, value: weeks, to: self)!
	}

	func adding(months: Int) -> Date {
		return Calendar.autoupdatingCurrent.date(byAdding: .month, value: months, to: self)!
	}

	func subtracting(weeks: Int) -> Date {
		return adding(weeks: -weeks)
	}
}
