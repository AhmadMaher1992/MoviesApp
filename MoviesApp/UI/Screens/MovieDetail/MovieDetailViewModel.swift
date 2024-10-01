//
//  MovieDetailViewModel.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published private(set) var movieList: [Movie] = []

    private var service: MoviesService
    private var movieId: Int = 0
    
    init(movieId: Int) {
        self.service = MoviesService()
        self.movieId = movieId
    }
    
    func fetchMovieDetail() {
        print("Fetching movie with ID: \(movieId)");

        Task {
            let result = await service.getMovieDetail(id: self.movieId)
            DispatchQueue.main.async {
                switch result {
                    case .success(let res):
                    self.movieList = [res]
                    case .failure(let error):
                        print(error.customMessage)
                }
            }
        }
    }
    
}
