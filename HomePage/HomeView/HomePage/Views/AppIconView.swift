//
//  AppIconView.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 09/03/23.
//

import SwiftUI

struct AppIconView: View {
    
    let app: AppModel
    private let iconWidth : CGFloat = 60
    private let iconCornerRadius : CGFloat = 8
    private let iconHeight : CGFloat = 60
    private let iconOpacity : CGFloat = 0.2
    private let iconRadius : CGFloat = 3
    private let imageWidth : CGFloat = 50
    private let imageHeight: CGFloat = 50
    private let appNameFontSize: CGFloat = 12
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: iconCornerRadius)
                    .frame(width: iconWidth, height: iconHeight)
                    .foregroundColor(Color.gray.opacity(iconOpacity))
                    .shadow(radius: iconRadius)
                Image(systemName: app.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth, height: imageHeight)
            }
            Text(app.name)
                .font(.system(size: appNameFontSize))
                .foregroundColor(Color(.label))
                .multilineTextAlignment(.center)
        }
    }
}

struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconView(app: AppModel(name: "Calculator", icon: "plus.slash.minus"))
    }
}
