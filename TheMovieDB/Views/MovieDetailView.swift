//
//  MovieDetailView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 31/7/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    @ObservedObject private var movieDetailState = MovieDetailState()
    let movieId: Int
    
    var body: some View {
        ZStack{
            if let movie = self.movieDetailState.movie{
                MovieDetailDataView(movie: movie)
            }
            
        }
        .navigationTitle(movieDetailState.movie?.title ?? "")
        .colorScheme(.dark)
        .onAppear{
            self.movieDetailState.loadMovieDetail(with: movieId)
        }
    }
}
