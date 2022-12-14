//
//  MovieSearchState.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 31/7/22.
//

import SwiftUI
import Combine
import Foundation

class MovieSearchState: ObservableObject{
    
    @Published var query = ""
    @Published var movies: [Movie]?
    @Published var isLoading = false
    
    private var subscriptionToken: AnyCancellable?
    
    let movieService = MovieServices()
    
    deinit{
        self.subscriptionToken?.cancel()
        self.subscriptionToken = nil
    }
    
    func startObserve(){
        guard subscriptionToken == nil else {
            return
        }
        
        self.subscriptionToken = self.$query
            .map { [weak self] searchText in
                self?.movies = nil
                return searchText
            }.throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink { [weak self] in
                self?.search(query: $0)
            }
    }
    
    func search(query: String){
        self.movies = nil
        self.isLoading = false
        
        guard !query.isEmpty else{
            return
        }
        
        self.isLoading = true
        self.movieService.searchMovie(query: query) { [weak self] result in
            guard let self = self, query == self.query else {
                return
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
                switch result{
                case .success(let movies):
                    self.movies = movies.results
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
            
        }
    }
    
}
