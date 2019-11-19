//
//  ApiManager.swift
//  StarWars
//
//  Created by Simon Bromberg on 2019-11-13.
//  Copyright © 2019 SBromberg. All rights reserved.
//

import Foundation

class ApiManager {
	var baseURL = "https://swapi.co/api/"
	let defaultSession = URLSession(configuration: .default)

	static var shared = ApiManager()

	enum Endpoint: String {
		case people = "people"
	}

	var dataTask: URLSessionDataTask?

	func getPeople(_ completion: @escaping (_ people: [Person]?) -> Void) {
		guard var url = URL(string: baseURL) else { return }
		url.appendPathComponent(Endpoint.people.rawValue)

		dataTask?.cancel()

		dataTask = defaultSession.dataTask(with: url) { data, response, error in
			guard let data = data else { return }

			var people: [Person]?

			do {
				let personData = try JSONDecoder().decode(PersonData.self, from: data)
				people = personData.results
			} catch { print(error) }

			completion(people)
		}

		dataTask?.resume()
	}
}
