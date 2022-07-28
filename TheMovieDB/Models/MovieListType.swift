//
//  MovieListType.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import Foundation

enum MovieListType: String{
    
    case nowPlaying
    case popular
    case topRated
    case upcomming
    
    var endpoint: String{
        switch self {
        case .nowPlaying:
            return "now_playing"
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .upcomming:
            return "upcoming"
        }
    }
    
}
