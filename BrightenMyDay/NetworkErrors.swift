//
//  NetworkErrors.swift
//  BrightenMyDay
//
//  Created by Vince Muller on 9/5/24.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidEnpoint
    case unableToComplete
    case invalidResponse
    case invalidData
    case invalidCategory
    
    var failureReason: String? {
        switch self {
        case .invalidEnpoint:
            return "Invalid endpoint"
        case .unableToComplete:
            return "Unable to complete your request. Please check your internet connection."
        case .invalidResponse:
            return "Our joke generator looks to be asleep, please try again and maybe it will wake up."
        case .invalidData:
            return "The joke generated was so bad it wasn't worth sharing. Please try again."
        case .invalidCategory:
            return "Please select a joke category"
        }
    }
}
