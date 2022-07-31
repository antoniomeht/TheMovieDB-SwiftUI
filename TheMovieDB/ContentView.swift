//
//  ContentView.swift
//  TheMovieDB
//
//  Created by Antonio Araez Moreno on 31/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MovieListView()
                .tabItem {
                    VStack{
                        Image(systemName: "tv")
                        Text("Movie list")
                    }
                }
                .tag(0)
            
            MovieSearchView()
                .tabItem {
                    VStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search Movies")
                    }
                }
        }
        .colorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
