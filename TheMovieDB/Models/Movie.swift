//
//  Movie.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import Foundation

struct Movie: Codable{
    let id: Int
    let title: String
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let genreIds: [Int]?
    let releaseDate: String?
    let popularity: Double?
    let voteCount: Int?
    let voteAverage: Int?
    let video: Bool?
    let adult: Bool?
    let originalLanguage: String?
    let originalTitle: String?
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    enum CodingKeys: String, CodingKey {
            
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case releaseDate = "release_date"
        case popularity
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case video
        case adult
        case originalLanguage = "original_laguage"
        case originalTitle = "original_title"
        
    }
    
}
