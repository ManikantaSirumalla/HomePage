//
//  BottomIconView.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 09/03/23.
//

import SwiftUI

struct BottomIconView: View {
    
    let app: AppModel
    private let iconWidth : CGFloat = 60
    private let iconCornerRadius : CGFloat = 8
    private let iconHeight : CGFloat = 60
    private let iconOpacity : CGFloat = 0.2
    private let imageWidth : CGFloat = 50
    private let imageHeight: CGFloat = 50
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: iconCornerRadius)
                .frame(width: iconWidth, height: iconHeight)
                .foregroundColor(Color.gray.opacity(iconOpacity))
            
            Image(systemName: app.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth, height: imageHeight)
                .padding()
        }
    }
}
struct BottomIconView_Previews: PreviewProvider {
    static var previews: some View {
        BottomIconView(app: AppModel(name: "Calculator", icon: "plus.slash.minus"))
    }
}
