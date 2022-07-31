//
//  MovieServices.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import Foundation

protocol MovieServiceProtocol{
    
    func getMovies(from endpoint: MovieListType, completion: @escaping (Result<MovieList, MovieErrorType>) -> ())
    func getMovie(id: Int, completion: @escaping (Result<Movie, MovieErrorType>) -> ())
    func searchMovie(query: String, completion: @escaping (Result<MovieList, MovieErrorType>) -> ())
    
}

class MovieServices: MovieServiceProtocol{
    
    static let shared = MovieServices()
    
    private let PATH = "https://api.themoviedb.org/3"
    
    func getMovies(from listType: MovieListType, completion: @escaping (Result<MovieList, MovieErrorType>) -> ()) {
        guard let url = URL(string: "\(PATH)/movie/\(listType.endpoint)") else{
            completion(.failure(.invalidEndpoint))
            return
        }
        ServiceManager.loadURLAndDecode(url: url, completion: completion)
    }
    
    func getMovie(id: Int, completion: @escaping (Result<Movie, MovieErrorType>) -> ()) {
        guard let url = URL(string: "\(PATH)/movie/\(id)") else{
            completion(.failure(.invalidEndpoint))
            return
        }
        
        let params: [String: Any] = [
            "append_to_response": "videos, credits"
        ]
        
        ServiceManager.loadURLAndDecode(url: url, params: params, completion: completion)
    }
    
    func searchMovie(query: String, completion: @escaping (Result<MovieList, MovieErrorType>) -> ()) {
        guard let url = URL(string: "\(PATH)/search/movie/") else{
            completion(.failure(.invalidEndpoint))
            return
        }
        
        let params: [String: Any] = [
            "language": "en-US",
            "query": query
        ]
        
        ServiceManager.loadURLAndDecode(url: url, params: params, completion: completion)
    }
    
    
}
