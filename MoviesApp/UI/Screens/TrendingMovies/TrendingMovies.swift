//
//  TrendingMovies.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import SwiftUI

struct TrendingMovies: View {
    @ObservedObject var viewModel: ViewModel
    @State private var searchText = ""
    
    var filteredMovies: [Movie] {
        if searchText.isEmpty {
            return viewModel.state.movies
        } else {
            return viewModel.state.movies.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            ZStack { // Use ZStack to layer the "No search results" message
                List {
                    // Display filtered movies
                    ForEach(filteredMovies) { movie in
                        NavigationLink(destination: MovieDetail(movieTitle: movie.title, viewModel: .init(movieId: movie.id))) {
                            MovieListItem(movie: movie)
                        }
                    }
                    
                    // Show "Load more movies" button only when not searching and there are more movies to load
                    if searchText.isEmpty && viewModel.state.canLoadNextPage {
                        Button(action: {
                            viewModel.fetchNextPageIfPossible()
                        }) {
                            Text("Load more movies")
                        }
                        .accessibility(identifier: "loadMore")
                    }
                }
                .navigationTitle("Top Rated Movies")
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search movies...")
                
                // Show "No search results" when search yields no results
                if filteredMovies.isEmpty && !searchText.isEmpty {
                    VStack {
                        Text("No search results")
                            .foregroundColor(.gray)
                            .italic()
                            .font(.title)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.clear) // Transparent background to let List be behind
                    .multilineTextAlignment(.center)
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

struct PopularMovies_Previews: PreviewProvider {
    static var previews: some View {
        TrendingMovies(viewModel: TrendingMovies.ViewModel.init())
    }
}
