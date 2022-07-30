//
//  Movie.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import Foundation

struct Movie: Codable, Identifiable{
    let id: Int?
    let title: String?
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let genreIds: [Int]?
    let releaseDate: String?
    let popularity: Double?
    let voteCount: Int?
    let voteAverage: Double?
    let video: Bool?
    let adult: Bool?
    let originalLanguage: String?
    let originalTitle: String?
    
    var backdropURL: URL {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
        return url
    }
    
    var posterURL: URL {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
        return url
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
