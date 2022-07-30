//
//  MovieListState.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 30/7/22.
//

import SwiftUI

class MovieListState: ObservableObject{

    @Published var movies: [Movie]?
    
    private let manager = MovieServices()
    
    func loadMovies(listType: MovieListType){
        movies = nil
        manager.getMovies(from: listType) { [weak self] result in
            guard let self = self else{
                return
            }
            
            DispatchQueue.main.async {
                switch result{
                case .success(let response):
                    self.movies = response.results
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }

        }
    }
}
