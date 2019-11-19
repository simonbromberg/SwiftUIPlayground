//
//  Person.swift
//  StarWars
//
//  Created by Simon Bromberg on 2019-11-13.
//  Copyright © 2019 SBromberg. All rights reserved.
//

import Foundation

struct PersonData: Decodable {
	let results: [Person]
}

struct Person: Decodable {
	let id = UUID()

	var name: String
	var height: String
	var mass: String
	var hair_color: String
	var skin_color: String
}
