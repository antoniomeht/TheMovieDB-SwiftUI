//
//  MovieListType.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import Foundation

enum MovieListType: String{
    
    case nowPlaying = "Now playing"
    case popular = "Popular"
    case topRated = "Top rated"
    case upcomming = "Upcomming"
    
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
