//
//  JokesModel.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import Foundation

struct Category: Codable {
    var categories: [String]
}

struct Joke: Codable {
    var setup: String?
    var delivery: String?
    var joke: String?
}
