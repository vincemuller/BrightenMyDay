//
//  View+Ext.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import Foundation
import SwiftUI

extension View {
    func alert(isPresented: Binding<Bool>, errorMessage: String) -> some View {
        return alert("Uh Oh...Joke Error", isPresented: isPresented) {
            Button("Ok") {}
        } message: {
            Text(errorMessage)
        }

    }
}
