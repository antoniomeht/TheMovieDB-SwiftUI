//
//  MovieCarouselView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 28/7/22.
//

import SwiftUI

struct MovieCardCarouselView: View {
    
    let title: String
    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 8){
                    ForEach(self.movies){ movie in
                        MovieCardView(movie: movie)
                            .frame(width: 300, height: 200, alignment: .center)
                            .padding(.leading, movie.id == self.movies.first?.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.last?.id ? 16 : 0)
                    }
                }
            }
            
        }
    }
}

struct MovieCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardCarouselView(title: "", movies: [])
    }
}
