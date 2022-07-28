//
//  MovieErrorType.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import Foundation

enum MovieErrorType: Error{
    
    case apiError
    case invalidEndpoint
    case noResponse
    case decoding
    
    var apiCall: String{
        switch self {
        case .apiError:
            return "Failed to get data"
        case .invalidEndpoint:
            return "Invalid endpoint"
        case .noResponse:
            return "No server response"
        case .decoding:
            return "Decoding error"
        }
    }
    
}
