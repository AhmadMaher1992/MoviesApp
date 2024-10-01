//
//  MovieService.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import Foundation

protocol IMoviesService {
    func getPopularMovies(page: Int) async -> Result<TrendingMovieList, RequestError>
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError>
}

struct MoviesService: ApiRepository, IMoviesService {
    func getPopularMovies(page: Int = 1) async -> Result<TrendingMovieList, RequestError> {
        return await sendRequest(endpoint: ApiEndpoints.moviePopular(page: page), responseModel: TrendingMovieList.self)
    }
    
    func getMovieDetail(id: Int) async -> Result<Movie, RequestError> {
        return await sendRequest(endpoint: ApiEndpoints.movieDetail(id: id), responseModel: Movie.self)
    }
}
