//
//  MovieDetail.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import SwiftUI

struct MovieDetail: View {
    let movieTitle: String
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.movieList) { movie in
                // Movie Poster
                VStack {
                    MovieImage(path: movie.posterPath, width: 250)
                }
                
                VStack {
                    Text(movie.overview)
                }
                
                HStack{
                    Text("ID: ")
                    Text("\(movie.id)").font(.subheadline).foregroundColor(.gray)
                }
                
                HStack{
                    Text("Original title: ")
                    Text("\(movie.originalTitle)").font(.subheadline).foregroundColor(.gray)
                }
                
                HStack{
                    Text("Released Year: ")
                    Text("\(movie.yearText)").font(.subheadline).foregroundColor(.gray)
                }
                
                HStack{
                    Text("Original language: ")
                    Text("\(movie.originalLanguage)").font(.subheadline).foregroundColor(.gray)
                }
                
                HStack{
                    Text("Votes: ")
                    Text("\(movie.voteCount ?? 0)").font(.subheadline).foregroundColor(.gray)
                }
                
                HStack{
                    Text("Popularity: ")
                    Text("\(movie.popularity ?? 0.0)").font(.subheadline).foregroundColor(.gray)
                }
                
                // Genres
                if let genres = movie.genres, !genres.isEmpty {
                    HStack{
                        Text("Genres: ")
                        Text("\(genres.map { $0.name }.joined(separator: ", "))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                }
                
                
                // Status
                if let status = movie.status {
                    HStack {
                        Text("Status:")
                        Text(status)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                // Budget
                if let budget = movie.budget, budget > 0 {
                    HStack {
                        Text("Budget:")
                        Text("$\(budget.formattedWithSeparator())")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                // Runtime
                if let runtime = movie.runtime, runtime > 0 {
                    HStack {
                        Text("Runtime:")
                        Text(movie.durationText)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                
            }
        }
        .onAppear() {
            viewModel.fetchMovieDetail()
        }
        .navigationTitle(movieTitle)
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movieTitle: "", viewModel: .init(movieId: 1))
    }
}


