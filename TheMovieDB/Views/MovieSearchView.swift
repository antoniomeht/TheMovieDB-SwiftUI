//
//  MovieSearchView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 31/7/22.
//

import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.boldSystemFont(ofSize: 20)]
    }
    
    var body: some View {
        NavigationView{
            List{
                SearchBarView(placeholder: "Search movies", text: self.$movieSearchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                
                if self.movieSearchState.movies != nil{
                    ForEach(self.movieSearchState.movies ?? []){ movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id ?? 0)) {
                            VStack(alignment: .leading){
                                Text(movie.title ?? "")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Search movies")
        }
        .colorScheme(.dark)
        .onAppear{
            self.movieSearchState.startObserve()
        }
    }
}
