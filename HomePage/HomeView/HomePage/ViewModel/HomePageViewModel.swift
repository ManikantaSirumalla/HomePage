//
//  HomePageViewModel.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 12/04/23.
//
import Combine
import SwiftUI

final class HomePageViewModel: ObservableObject {
    
    @Published var currentPage = 0
    @Published var isPresentedSearchView = false
    @Published var showPaginationView = false
    @Published var timerCancellable: AnyCancellable?
 
    func currentPageDidChange(_ index: Int) {
        showPaginationView = true
        timerCancellable?.cancel()
        timerCancellable = Just("")
            .delay(for: .seconds(2), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [self] _ in
                self.showPaginationView = false
                timerCancellable?.cancel()
            })
    }
    
    func searchButtonTapped() {
        withAnimation {
            isPresentedSearchView = true
        }
    }
}

