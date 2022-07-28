//
//  ContentView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 27/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Prueba", action: prueba)
    }
    
    func prueba(){
        MovieServices().getMovies(from: .nowPlaying) { response in
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
