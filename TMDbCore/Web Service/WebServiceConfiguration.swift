//
//  WebServiceConfiguration.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 21/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

internal struct WebServiceConfiguration {
	let language: String
	let apiKey: String

	private class Dummy {}

	static let `default` = WebServiceConfiguration(language: Bundle.main.preferredLocalizations[0],
	                                               apiKey: Bundle(for: WebServiceConfiguration.Dummy.self)
													.infoDictionary?["TMDB_API_KEY"] as? String ?? "")

	var parameters: [String: String] {
		return ["api_key": apiKey, "language": language]
	}
}
