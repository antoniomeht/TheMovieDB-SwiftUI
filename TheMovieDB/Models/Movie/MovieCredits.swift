//
//  MovieCredits.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 31/7/22.
//

import Foundation

struct MovieCredits: Codable{
    let cast: [MovieCreditCast]
    let crew: [MovieCreditCrew]
}
