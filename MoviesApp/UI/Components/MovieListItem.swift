//
//  ContentView.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import SwiftUI

struct MovieListItem: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            MovieImage(path: movie.posterPath)
            VStack(alignment: .leading) {
                Text(movie.title)
                Text("Year: \(movie.yearText)").font(.subheadline).foregroundColor(.gray)
            }
        }
    }
}

