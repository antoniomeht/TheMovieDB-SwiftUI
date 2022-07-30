//
//  MoviePosterView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 28/7/22.
//

import SwiftUI

struct MoviePosterView: View {
    
    var movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4){
            ZStack{
                if self.imageLoader.image != nil{
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(2/3, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(movie.title ?? "")
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .lineLimit(1)
        .onAppear{
            self.imageLoader.loadImage(with: movie.posterURL)
        }
    }
}

struct MoviePosterView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterView(movie: Movie(id: 0, title: "Prueba titulo", overview: "", posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg", backdropPath: "/rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg", genreIds: nil, releaseDate: nil, popularity: nil, voteCount: nil, voteAverage: nil, video: nil, adult: nil, originalLanguage: nil, originalTitle: nil))
    }
}
