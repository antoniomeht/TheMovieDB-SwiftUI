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
    
    let genres: [MovieGenre]?
//    let credits: MovieCredits?
    
    let releaseDate: String?
    let popularity: Double?
    let voteCount: Int?
    let voteAverage: Double?
    let video: Bool?
    let adult: Bool?
    let originalLanguage: String?
    let originalTitle: String?
    let runtime: Int?
    
    let production: [ProductionCompanies]?
    
    var backdropURL: URL {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
        return url
    }
    
    var posterURL: URL {
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
        return url
    }
    
    var mainGenre: String{
        return genres?.first?.name ?? "Unknown genre"
    }
    
    var yearString: String{
        return MovieDateFormatter().movieDateString(from: releaseDate ?? "")
    }
    
    var movieDuration: String{
        return MovieDateFormatter().durationString(time: self.runtime)
    }
    
//    var getDirectors: [MovieCreditCrew]?{
//        return credits?.crew.filter({ $0.job?.lowercased() == "director"})
//    }
//
//    var getProducers: [MovieCreditCrew]?{
//        return credits?.crew.filter({ $0.job?.lowercased() == "producer"})
//    }
//
//    var getWriters: [MovieCreditCrew]?{
//        return credits?.crew.filter({ $0.job?.lowercased() == "story"})
//    }
    
    enum CodingKeys: String, CodingKey {
            
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case genres
//        case credits
        case releaseDate = "release_date"
        case popularity
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case video
        case adult
        case originalLanguage = "original_laguage"
        case originalTitle = "original_title"
        case runtime
        case production = "production_companies"
        
    }
    
}
