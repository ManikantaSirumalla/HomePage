//
//  BottomIconContainer.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 03/04/23.
//

import SwiftUI

struct BottomIconContainer: View {
    
    private let BottomIconContainerCornerRadius: CGFloat = 25
    private let BottomIconContainerOpacity: CGFloat = 0.3
    private let BottomIconContainerWidth: CGFloat = 360
    private let BottomIconContainerHeight: CGFloat = 80
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: BottomIconContainerCornerRadius)
                .foregroundColor(Color.gray.opacity(BottomIconContainerOpacity))
            HStack {
                BottomIconView(app: apps[19])
                BottomIconView(app: apps[21])
                BottomIconView(app: apps[22])
                BottomIconView(app: apps[16])
            }
        } .frame(width: BottomIconContainerWidth  , height: BottomIconContainerHeight)
    }
}

struct BottomIconContainer_Previews: PreviewProvider {
    static var previews: some View {
        BottomIconContainer()
    }
}
