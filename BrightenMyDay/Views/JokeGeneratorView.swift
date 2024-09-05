//
//  JokeGeneratorView.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import SwiftUI

struct JokeGeneratorView: View {
    @Binding var jokeSetup: String?
    @Binding var jokeDelivery: String?
    @Binding var joke: String?
    
    var body: some View {
        VStack {
            Text((jokeSetup ?? joke) ?? "")
                .font(.system(size: 16, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
            Text(jokeDelivery ?? "")
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
                .foregroundStyle(.black)
                .padding(.vertical)
        }.frame(width: 340, height: 200)
    }
}

//#Preview {
//    JokeGeneratorView()
//}
