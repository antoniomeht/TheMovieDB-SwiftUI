//
//  MoviePosterCarouselView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 28/7/22.
//

import SwiftUI

struct MoviePosterCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 8){
                    ForEach(self.movies){ movie in
                        MoviePosterView(movie: movie)
                            .padding(.leading, movie.id == self.movies.first?.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.last?.id ? 16 : 0)
                    }
                }
            }
            .frame(height: 300)
            
        }
    }
}

struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarouselView(title: "", movies: [])
    }
}
