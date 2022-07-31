//
//  MovieCreditCast.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 31/7/22.
//

import Foundation

struct MovieCreditCast: Codable, Identifiable{
    let id: Int?
    let character: String?
    let name: String?
}
