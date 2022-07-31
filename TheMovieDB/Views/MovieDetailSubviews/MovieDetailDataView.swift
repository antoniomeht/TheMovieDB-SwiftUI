//
//  MovieDetailDataView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 31/7/22.
//

import SwiftUI

struct MovieDetailDataView: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        
        if let savedMovies = UserDefaults.standard.object(forKey: "StoredMovies") as? Data,
            var loadedMovies = try? JSONDecoder().decode([Movie].self, from: savedMovies) {
            if !loadedMovies.contains(where: { $0.id == movie.id }) {
                loadedMovies.insert(movie, at: 0)
                encodeMovies(movies: loadedMovies)
            }
        } else {
            encodeMovies(movies: [movie])
        }
    }
    
    func encodeMovies(movies: [Movie]){
        var moviesToEncode = movies
        
        if moviesToEncode.count >= 20{
            moviesToEncode = Array(moviesToEncode[0..<20])
        }
        
        if let encoded = try? JSONEncoder().encode(moviesToEncode) {
            UserDefaults.standard.set(encoded, forKey: "StoredMovies")
        }
    }
    
    var body: some View {
        List{
            if let image = self.imageLoader.image{
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(16/9, contentMode: .fit)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            VStack(alignment: .leading){
                Text("\(movie.mainGenre) - \(movie.movieDuration) - \(movie.yearString)")
            }
            .listRowSeparator(.hidden)
            VStack{ 
                Text(movie.overview ?? "No Description")
                Spacer()
                if let rating = movie.voteAverage{
                    Text("Rating: \(String(format: "%.2f", rating))/10")
                }
            }
            
            VStack(alignment: .leading, spacing: 8){
                
                if let productors = movie.production{
                    ForEach(productors){ productor in
                        if let name = productor.name{
                            Text(name)
                        }
                    }
                }
            }
        }
        .onAppear{
            self.imageLoader.loadImage(with: movie.backdropURL)
        }
    }
}

struct MovieDetailDataView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailDataView(movie: Movie(id: 0, title: "Titulo", overview: "Descripcion", posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg", backdropPath: "/rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg", genres: nil, releaseDate: nil, popularity: nil, voteCount: nil, voteAverage: nil, video: nil, adult: nil, originalLanguage: nil, originalTitle: nil, runtime: 120, production: nil))
    }
}
