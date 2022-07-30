//
//  MovieListView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import SwiftUI
import RxSwift

struct MovieListView: View {
    
    @ObservedObject private var popularState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcommingState = MovieListState()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.boldSystemFont(ofSize: 20)]
    }
    
    var body: some View {
        NavigationView{
            List{
                getMovieListView(listType: .popular, carouselType: .poster)
                getMovieListView(listType: .topRated, carouselType: .backdrop)
                getMovieListView(listType: .nowPlaying, carouselType: .backdrop)
                getMovieListView(listType: .upcomming, carouselType: .backdrop)
            }
            .navigationBarTitle("The Movie Database - SwiftUI")
            .colorScheme(.dark)
            
            
        }
        .onAppear{
            self.popularState.loadMovies(listType: .popular)
            self.topRatedState.loadMovies(listType: .topRated)
            self.nowPlayingState.loadMovies(listType: .nowPlaying)
            self.upcommingState.loadMovies(listType: .upcomming)
        }
    }
    
    func getMovieListView(listType: MovieListType, carouselType: CarouselType) -> some View{
        
        switch listType {
        case .nowPlaying:
            return AnyView(MoviePosterCarouselView(title: listType.rawValue, movies: nowPlayingState.movies ?? []))
            
        case .popular:
            return AnyView(MovieCardCarouselView(title: listType.rawValue, movies: popularState.movies ?? []))

        case .topRated:
            return AnyView(MovieCardCarouselView(title: listType.rawValue, movies: topRatedState.movies ?? []))

        case .upcomming:
            return AnyView(MovieCardCarouselView(title: listType.rawValue, movies: upcommingState.movies ?? []))

        }
    }
    
    struct MovieListView_Previews: PreviewProvider {
        static var previews: some View {
            MovieListView()
                .previewDevice("iPhone 11 Pro")
        }
    }
}
