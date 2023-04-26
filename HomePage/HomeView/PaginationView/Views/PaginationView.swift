//
//  PV.swift
//  HomePage
//
//  Created by Manikanta Sirumalla on 11/04/23.
//

import SwiftUI

struct PaginationView: View {
    
    @ObservedObject var paginationVM = PaginationViewModel()
    private let frameWidth: CGFloat = 8
    private let frameHeight: CGFloat = 8
    private let dotSpacing: CGFloat = 8

    var body: some View {
            HStack(spacing: dotSpacing) {
                ForEach(paginationVM.pageRange(), id: \.self) { index in
                    Circle()
                        .foregroundColor(paginationVM.currentPage == index ? .white : .gray)
                        .frame(width: frameWidth, height: frameHeight)
                        .scaleEffect(paginationVM.scaleEffect(for: index))
                }
            }.animation(.default, value: paginationVM.currentPage)
    }
}
