//
//  MovieListView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import SwiftUI
import Alamofire

struct MovieListView: View {
    
    @ObservedObject private var popularState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var upcommingState = MovieListState()
    
    @State private var savedMovies = [Movie]()
    @ObservedObject var monitor = NetworkMonitor()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.boldSystemFont(ofSize: 20)]
    }
    
    var body: some View {
        NavigationView{
            List{
                if monitor.isConnected{
                    getMovieListView(listType: .popular, carouselType: .poster)
                    getMovieListView(listType: .topRated, carouselType: .backdrop)
                    getMovieListView(listType: .nowPlaying, carouselType: .backdrop)
                    getMovieListView(listType: .upcomming, carouselType: .backdrop)
                }
                getMovieListView(listType: .lastViewed, carouselType: .backdrop)
            }
            .navigationBarTitle("The Movie Database - SwiftUI")
            .colorScheme(.dark)
            
            
        }
        .onAppear{
            self.popularState.loadMovies(listType: .popular)
            self.topRatedState.loadMovies(listType: .topRated)
            self.nowPlayingState.loadMovies(listType: .nowPlaying)
            self.upcommingState.loadMovies(listType: .upcomming)
            
            if let savedMovies = UserDefaults.standard.object(forKey: "StoredMovies") as? Data,
                let loadedMovies = try? JSONDecoder().decode([Movie].self, from: savedMovies) {
                self.savedMovies = loadedMovies
            } else {
                self.savedMovies = []
            }
        }
    }
    
    func getMovieListView(listType: MovieListType, carouselType: CarouselType) -> (some View)??{
        
        var view: AnyView
        switch listType {
        case .nowPlaying:
            view = AnyView(MoviePosterCarouselView(title: listType.rawValue, movies: nowPlayingState.movies ?? []))
        case .popular:
            view = AnyView(MovieCardCarouselView(title: listType.rawValue, movies: popularState.movies ?? []))
        case .topRated:
            view = AnyView(MovieCardCarouselView(title: listType.rawValue, movies: topRatedState.movies ?? []))
        case .upcomming:
            view = AnyView(MovieCardCarouselView(title: listType.rawValue, movies: upcommingState.movies ?? []))
        case .lastViewed:
            if self.savedMovies.count == 0{
                view = AnyView(EmptyView())
            } else {
                view = AnyView(MovieCardCarouselView(title: listType.rawValue, movies: self.savedMovies))
            }
        }
        
        return view
            .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            .listRowSeparator(.hidden)
        
    }
    
    struct MovieListView_Previews: PreviewProvider {
        static var previews: some View {
            MovieListView()
                .previewDevice("iPhone 11 Pro")
        }
    }
}
