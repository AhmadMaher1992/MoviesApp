//
//  TrendingMovieList.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import Foundation

struct TrendingMovieList: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
}
