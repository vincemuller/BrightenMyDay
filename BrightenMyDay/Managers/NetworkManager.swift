//
//  NetworkManager.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import Foundation

final class NetworkManager {
    
    private let baseURL = "https://v2.jokeapi.dev/"      //The static url for the api http(s) request
    
    init() {}  //This combined with the static variable creates the singleton
    
    func getJokeCategories() async throws -> Category {
        
        let endpoint = baseURL + "categories"
        
        var request = URLRequest(url: URL(string: endpoint)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let d = try decoder.decode(Category.self, from: data)
            return d
        } catch {
            throw NetworkError.invalidData
        }
    }
    
    func generateJokes(category: String) async throws -> Joke {
        let endpoint = baseURL + "joke/\(category)"
        
        var request = URLRequest(url: URL(string: endpoint)!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let d = try decoder.decode(Joke.self, from: data)
            return d
        } catch {
            throw NetworkError.invalidData
        }
    }
    
}
