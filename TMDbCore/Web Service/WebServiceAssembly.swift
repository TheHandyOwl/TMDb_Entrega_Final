//
//  WebServiceAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 26/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class WebServiceAssembly {
	private(set) lazy var webService = WebService(configuration: .default)

	private(set) lazy var dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		formatter.timeZone = TimeZone(secondsFromGMT: 0)

		return formatter
	}()
}
