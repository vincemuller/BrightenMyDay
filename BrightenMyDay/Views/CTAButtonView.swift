//
//  CTAButtonView.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import SwiftUI

struct CTAButtonView: View {
    var action: () -> () = {print("function to execute")}
    var label: String = ""
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.black)
                    .frame(width: 300, height: 50)
                Text(label)
                    .foregroundStyle(.white)
                    .font(.title3)
            }
        })

    }
}

#Preview {
    CTAButtonView()
}
