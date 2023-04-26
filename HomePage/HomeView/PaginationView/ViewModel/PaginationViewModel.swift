//
//  PaginationViewModel.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 11/04/23.
//

import SwiftUI

final class PaginationViewModel: ObservableObject {
    
    @Published var numberOfPages: Int
    @Published var currentPage: Int
    private let dotsInTheContainer: Int = 4
    
    init(numberOfPages: Int = 0, currentPage: Int = 0) {
        self.numberOfPages = numberOfPages
        self.currentPage = currentPage
    }
    
    func pageRange() -> Range<Int> {
        let visiblePages = min(numberOfPages, dotsInTheContainer)
        let startIndex = max(0, min(currentPage - visiblePages/2, numberOfPages - visiblePages))
        return startIndex..<startIndex+visiblePages
    }
    
    func scaleEffect(for index: Int) -> CGFloat {
        let normalScale: CGFloat = 1.0
        let smallScale: CGFloat = 0.7
        let leftMostPage = currentPage - 2
        let rightMostPage = currentPage + 1
        let isLastPage = numberOfPages - 1
        let isLastSecondPage = numberOfPages - 2
        let isLastThirdPage = numberOfPages - 3
        
        if numberOfPages <= dotsInTheContainer {
           return normalScale
        }
        else if currentPage == index {
            return normalScale * 1.0
        } else if (currentPage >= 3 && currentPage <= isLastThirdPage) {
            if index == leftMostPage || index == rightMostPage {
                return smallScale
            }else {
                return normalScale
            }
        } else if (currentPage == isLastPage) && index == (currentPage - 3) {
            return smallScale
        } else if (currentPage == isLastSecondPage) && index == leftMostPage {
            return smallScale
        } else if (currentPage == isLastThirdPage) && index == (currentPage - 1) {
            return smallScale
        }else if (currentPage <= 2) && index == 3 {
            return smallScale
        } else {
            return normalScale
        }
    }
}
