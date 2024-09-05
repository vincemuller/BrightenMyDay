//
//  TitleView.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Brighten Your Day\nWith A Joke")
            .font(.system(size: 20, weight: .semibold))
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
    }
}

#Preview {
    TitleView()
}
