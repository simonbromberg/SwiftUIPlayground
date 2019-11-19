//
//  ContentView.swift
//  StarWars
//
//  Created by Simon Bromberg on 2019-11-13.
//  Copyright © 2019 SBromberg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var people = PersonListData()

    var body: some View {
        NavigationView {
			List {
				ForEach(people.people, id: \.id) { person in
					Text(person.name)
				}
			}
		.navigationBarTitle("Star Wars")
		}
	}
}

class PersonListData: ObservableObject {
	@Published var people = [Person]()

	init() {
		ApiManager.shared.getPeople { [weak self] people in
			DispatchQueue.main.async {
				self?.people = people ?? []
            }
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {		
		ContentView()
    }
}
