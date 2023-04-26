//
//  search.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 02/03/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search tabs")
                
                TabView(selection: $selectedTab) {
                    ForEach(filteredTabs.indices, id: \.self) { index in
                        Text(filteredTabs[index].name)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onChange(of: searchText) { value in
                    let filteredIndices = tabs.indices.filter { index in
                        tabs[index].name.lowercased().contains(value.lowercased())
                    }
                    if let firstIndex = filteredIndices.first {
                        selectedTab = firstIndex
                    }
                }
            }
            .navigationTitle("Tabs")
        }
        .onAppear {
            selectedTab = 0
        }
    }
    
    var tabs: [Tab] = [
        Tab(name: "Tab 1"),
        Tab(name: "Tab 2"),
        Tab(name: "Tab 3"),
        Tab(name: "Tab 4"),
        Tab(name: "Tab 5"),
        Tab(name: "Tab 6"),
        Tab(name: "Tab 7"),
        Tab(name: "Tab 8"),
        Tab(name: "Tab 9"),
        Tab(name: "Tab 10"),
    ]
    
    var filteredTabs: [Tab] {
        tabs.filter { tab in
            tab.name.lowercased().contains(searchText.lowercased())
        }
    }
}

struct Tab {
    var name: String
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
       SearchView()
    }
}
