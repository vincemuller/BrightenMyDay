//
//  BrightenMyDayViewModel.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import Foundation

@MainActor final class BrightenMyDayViewModel: ObservableObject {

    @Published var networkManager = NetworkManager()
    @Published var categories: Category = Category(categories: [""])
    @Published var categorylabel: String = ""
    @Published var jokeGenerationIsActive: Bool = false
    @Published var joke = Joke(setup: "", delivery: "")
    @Published var errorMessage = ""
 
    func getCategories() async {
        Task {
            categories = try await networkManager.getJokeCategories()
        }
    }
    
    func getJoke() {
        Task {
            joke = try await networkManager.generateJokes(category: categorylabel)
        }
    }
}
