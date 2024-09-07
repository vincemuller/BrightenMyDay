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
    @Published var showError: Bool = false
    @Published var errorMessage = ""
 
    func getCategories() async {
        do {
            categories = try await networkManager.getJokeCategories()
        } catch let err as NetworkError {
            errorMessage = err.rawValue
        } catch let locError {
            //Add logging here
            print(locError)
        }
    }
    
    func getJoke() async {
        do {
            joke = try await networkManager.generateJokes(category: categorylabel)
        } catch let err as NetworkError {
            errorMessage = err.rawValue
        } catch let locError {
            //Add logging here
            print(locError)
        }
    }
}
