//
//  CategoryDropDownListView.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import SwiftUI

struct CategorySelectionView: View {
    @StateObject var viewModel: BrightenMyDayViewModel
    
    var body: some View {
        let categories = viewModel.categories.categories
        VStack {
            TitleView()
                .offset(y: -10)
            Menu {
                ForEach(categories, id: \.self){ option in
                    Button(action: {self.viewModel.categorylabel = option}, label: {
                        Text(option)
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                    })
                }
            } label: {
                Button(action: {}, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.black)
                            .frame(width: 200, height: 40)
                        Text(viewModel.categorylabel.isEmpty ? "Select Category" : viewModel.categorylabel)
                            .font(.system(size: 14))
                            .foregroundStyle(.black)
                    }
                })
            }
        }
    }
}

//#Preview {
//    CategoryDropDownListView()
//}
