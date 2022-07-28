//
//  MovieCard.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 28/7/22.
//

import SwiftUI

struct MovieCard: View {
    
    var movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            ZStack{
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                if self.imageLoader.image != nil{
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(movie.title)
        }
        .onAppear{
            self.imageLoader.loadImage(with: movie.backdropURL)
        }
    }

}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: Movie(id: 0, title: "Prueba titulo", overview: "", posterPath: "", backdropPath: "/ocUrMYbdjknu2TwzMHKT9PBBQRw.jpg", genreIds: nil, releaseDate: nil, popularity: nil, voteCount: nil, voteAverage: nil, video: nil, adult: nil, originalLanguage: nil, originalTitle: nil))
    }
}
