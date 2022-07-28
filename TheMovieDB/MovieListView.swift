//
//  MovieListView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import SwiftUI

struct MovieListView: View {
    var body: some View {
        Button("Prueba", action: prueba)
    }
    
    func prueba(){
        MovieServices().getMovies(from: .popular) { response in
            print(response)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
            .previewDevice("iPhone 11 Pro")
    }
}
