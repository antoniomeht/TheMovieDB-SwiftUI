//
//  MovieDetailState.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 31/7/22.
//

import SwiftUI

class MovieDetailState: ObservableObject{

    @Published var movie: Movie?
    
    private let manager = MovieServices()
    
    func loadMovieDetail(with id: Int){
        movie = nil
        manager.getMovie(id: id) { [weak self] result in
            guard let self = self else{
                return
            }
            
            DispatchQueue.main.async {
                switch result{
                case .success(let movie):
                    self.movie = movie
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }

        }
    }
}
