//
//  SSV.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 11/04/23.
//

import SwiftUI

struct SpotlightSearchView: View {
 
    @StateObject var spotlightSearchVM = SpotlightSearchViewModel()
    @Binding var isPresented: Bool
    let animation: Namespace.ID
    
    private let topHitAppIconSpacing : CGFloat = 20
    private let topHitAppIconWidth : CGFloat = 40
    private let topHitAppIconHeight : CGFloat = 40
    private let listRowWidth : CGFloat = 20
    private let listRowHeight : CGFloat = 20
    private let listRowForegroundOPacity : CGFloat = 0.7
    private let listRowBackgroundOpacity : CGFloat = 0.1
    private let textFieldWidth : CGFloat = 380
    private let textFieldHeight : CGFloat = 50
    private let textFieldOpacity : CGFloat = 0.7
    private let textFieldCornerRadius : CGFloat = 15
    private let imagePadding : CGFloat = 10
    private let imageOpacity : CGFloat = 0.8
    private let animationDuration: CGFloat = 0.2
    private let appNameFontSize : CGFloat = 12
    private let searchBarContainerWidth: CGFloat = 400
    private let searchBarContainerHeight: CGFloat = 55
    private let searchBarContainerOpacity: CGFloat = 0.5
    private let searchBarPadding: CGFloat = 2
    private let matchedGeometryID: String = "search"
    private let placeholderString = NSLocalizedString("search", comment: "")
    private let listSectionHeader1 = NSLocalizedString("top.hits", comment: "")
    private let listSectionHeader2 = NSLocalizedString("siri.suggestions", comment: "")
    private let listSectionHeader3 = NSLocalizedString("recent.searches", comment: "")
    
    var body: some View {
        VStack {
            List{
                if spotlightSearchVM .searchText != "" {
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: topHitAppIconSpacing) {
                                ForEach(spotlightSearchVM .filteredApps) { app in
                                    VStack {
                                        Image(systemName: "\(app.icon)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: topHitAppIconWidth,
                                                   height: topHitAppIconHeight)
                                        
                                        Text(app.name)
                                            .font(.system(size: appNameFontSize))
                                    }
                                }
                            }.padding(.all)
                        }
                    }
                header: {
                    Text(listSectionHeader1)
                }.listRowBackground(Color.white.opacity(listRowBackgroundOpacity))
                    Section {
                        ForEach(spotlightSearchVM .filteredApps) { app in
                            HStack {
                                Image(systemName: "\(app.icon)")
                                    .resizable()
                                    .frame(width: listRowWidth, height: listRowHeight,
                                           alignment: .trailing)
                                Text(app.name)
                                
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                header: {
                    Text(listSectionHeader2)
                    }.listRowBackground(Color.white.opacity(listRowBackgroundOpacity))
                } else {
                    Section{
                        ForEach(spotlightSearchVM .randomApps) { app in
                            HStack {
                                Image(systemName: "magnifyingglass.circle.fill")
                                    .resizable()
                                    .frame(width: listRowWidth, height: listRowHeight)
                                    .foregroundColor(.white)
                                    .opacity(listRowForegroundOPacity)
                                Text(app.name)
                            }
                        }
                    } header: {
                        Text(listSectionHeader3)
                            .bold()
                        }.listRowBackground(Color.white.opacity(listRowBackgroundOpacity))
                }
            }.scrollContentBackground(.hidden)
                .background(Color.clear)
                .transition(.move(edge: .top))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: animationDuration)) {
                        isPresented = false
                    }
                }
            
            ZStack {
                FirstResponderTextField(text: $spotlightSearchVM.searchText, placeHolder: placeholderString)
                    .matchedGeometryEffect(id: matchedGeometryID, in: animation)
                    .frame(width: textFieldWidth, height: textFieldHeight)
                    .background(Color.gray.opacity(textFieldOpacity))
                    .foregroundColor(.white)
                    .cornerRadius(textFieldCornerRadius)
                    .searchable(text: $spotlightSearchVM .searchText)
                    .overlay (
                        Image(systemName: "mic.fill")
                            .font(.title2)
                            .padding(.trailing, imagePadding)
                            .opacity(spotlightSearchVM.searchText.isEmpty ? 1 : 0)
                            .foregroundColor(Color.white.opacity(imageOpacity)),
                        alignment: .trailing
                    )
            }.frame(width: searchBarContainerWidth, height: searchBarContainerHeight)
                .padding(.all, searchBarPadding)
                .background(Color.black.opacity(searchBarContainerOpacity))
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: animationDuration)) {
                isPresented.toggle()
            }
        }
    }
}


