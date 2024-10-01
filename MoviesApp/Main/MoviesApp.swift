//
//  MoviesApp.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import SwiftUI

@main
struct MoviesApp: App {
    
    var body: some Scene {
        WindowGroup {
            TrendingMovies(viewModel: .init())
        }
    }
}
