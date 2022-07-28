//
//  MovieList.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 28/7/22.
//

import Foundation

struct MovieList: Codable{
    
    let results: [Movie]?
    let page: Int?
    let totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
            
        case results
        case page
        case totalPages = "total_pages"
    }
}
