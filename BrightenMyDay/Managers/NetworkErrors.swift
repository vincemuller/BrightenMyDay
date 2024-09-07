//
//  NetworkErrors.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import Foundation

enum NetworkError: String, Error {
    case invalidEnpoint     = "Invalid endpoint"
    case unableToComplete   = "Unable to complete your request. Please check your internet connection."
    case invalidResponse    = "Our joke generator looks to be asleep, please try again and maybe it will wake up."
    case invalidData        = "The joke generated was so bad it wasn't worth sharing. Please try again."
}
