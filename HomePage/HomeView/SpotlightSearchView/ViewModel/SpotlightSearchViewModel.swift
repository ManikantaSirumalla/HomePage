//
//  SearchViewModel.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 11/04/23.
//

import SwiftUI

final class SpotlightSearchViewModel: ObservableObject {
  
    @Published var searchText: String = ""

    var filteredApps: [AppModel] {
        return apps.filter { app in
            app.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var randomApps: [AppModel] {
        return Array(apps.shuffled().prefix(3))
    }
}
