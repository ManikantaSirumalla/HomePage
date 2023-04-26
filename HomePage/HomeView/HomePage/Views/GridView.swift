//
//  GridView.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 09/03/23.
//

import SwiftUI

struct GridView: View {
    
    let apps: [AppModel]
    private let itemsInWidth: CGFloat = 4
    private let itemsInHeight : CGFloat = 6
    private let topPadding : CGFloat = 50
    private let gridItemAdaptive: CGFloat = 80
    
    var body: some View {
        VStack {
            GeometryReader {geometry in
                let itemSize = geometry.size.width / itemsInWidth
                LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemAdaptive))]) {
                    ForEach(apps) { app in
                        AppIconView(app: app)
                            .padding(.bottom)
                    }
                }
                .frame(height: itemSize * itemsInHeight)
            }
        }.padding(.top, topPadding)
    }
}

