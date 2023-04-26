//
//  HomePageView2.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 12/04/23.
//

import SwiftUI

struct HomePageView: View {
    
    @StateObject var homePageVM = HomePageViewModel()
    @Namespace var animation
    private let totalTabs: Int = 8
    private let paginationContainerCornerRadius: CGFloat = 15
    private let paginationContainerOpacity: CGFloat = 0.3
    private let paginationContainerWidth: CGFloat = 80
    private let paginationContainerHeight: CGFloat = 30
    private let botttomContainerPadding: CGFloat = 5
    private let searchViewHeightMultiplier: CGFloat = 0.61
    private let searchFontSize: CGFloat = 12
    private let matchedGeometryID: String = "search"
    private let search = NSLocalizedString("search", comment: "")
    
    var body: some View {
        VStack {
            TabView(selection: $homePageVM.currentPage) {
                ForEach(0..<totalTabs, id:\.self) { index in
                    VStack {
                        GridView(apps: apps)
                            .padding()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .onChange(of: homePageVM.currentPage) { index in
                homePageVM.currentPageDidChange(index)
            }
            
            if homePageVM.isPresentedSearchView {
                SpotlightSearchView(isPresented: $homePageVM.isPresentedSearchView,
                                    animation: animation)
                .frame(width: homePageVM.isPresentedSearchView ?
                       UIScreen.main.bounds.width : paginationContainerWidth,
                       height: homePageVM.isPresentedSearchView ?
                       UIScreen.main.bounds.height * searchViewHeightMultiplier :
                        paginationContainerHeight )
            }
            
            ZStack {
                RoundedRectangle(cornerRadius: paginationContainerCornerRadius)
                    .matchedGeometryEffect(id: matchedGeometryID, in: animation)
                    .foregroundColor(.gray.opacity(paginationContainerOpacity))
                
                if homePageVM.showPaginationView {
                    PaginationView(paginationVM: PaginationViewModel(numberOfPages:
                                                                        totalTabs,
                                                                     currentPage:
                                                                        homePageVM.currentPage))
                } else {
                    Button(action: {
                        homePageVM.searchButtonTapped()
                    }) {
                        HStack(spacing: 0){
                            Image(systemName: "magnifyingglass")
                            Text(search)
                        }.font(.system(size: searchFontSize))
                            .foregroundColor(.white)
                    }
                    .opacity(homePageVM.isPresentedSearchView ? 0 : 1)
                }
            }.frame(width: paginationContainerWidth,
                    height: paginationContainerHeight)
            
            BottomIconContainer()
                .padding(.bottom, botttomContainerPadding)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.cyan]),
                startPoint: .top,endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
    }
}
