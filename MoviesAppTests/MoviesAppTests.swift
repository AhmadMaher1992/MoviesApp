//
//  MoviesAppTests.swift
//  MoviesAppTests
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import XCTest
@testable import MoviesApp

class MoviesAppTests: XCTestCase {
    
    // Sample Movie JSON string
    private let movieJSON = """
    {
        "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
        "adult": false,
        "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
        "release_date": "2016-08-03",
        "genre_ids": [14, 28, 80],
        "id": 297761,
        "original_title": "Suicide Squad",
        "original_language": "en",
        "title": "Suicide Squad",
        "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
        "popularity": 48.261451,
        "vote_count": 1466,
        "video": false,
        "vote_average": 5.91
    }
    """
    
    // Sample Trending Movie List JSON string
    private let popularMoviesJSON = """
    {
      "page": 1,
      "results": [
        {
          "poster_path": "/e1mjopzAS2KNsvpbpahQ1a6SkSn.jpg",
          "adult": false,
          "overview": "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
          "release_date": "2016-08-03",
          "genre_ids": [14, 28, 80],
          "id": 297761,
          "original_title": "Suicide Squad",
          "original_language": "en",
          "title": "Suicide Squad",
          "backdrop_path": "/ndlQ2Cuc3cjTL7lTynw6I4boP4S.jpg",
          "popularity": 48.261451,
          "vote_count": 1466,
          "video": false,
          "vote_average": 5.91
        },
        {
          "poster_path": "/lFSSLTlFozwpaGlO31OoUeirBgQ.jpg",
          "adult": false,
          "overview": "The most dangerous former operative of the CIA is drawn out of hiding to uncover hidden truths about his past.",
          "release_date": "2016-07-27",
          "genre_ids": [28, 53],
          "id": 324668,
          "original_title": "Jason Bourne",
          "original_language": "en",
          "title": "Jason Bourne",
          "backdrop_path": "/AoT2YrJUJlg5vKE3iMOLvHlTd3m.jpg",
          "popularity": 30.690177,
          "vote_count": 649,
          "video": false,
          "vote_average": 5.25
        }
      ],
      "total_results": 19629,
      "total_pages": 982
    }
    """
    
    override func setUpWithError() throws {
        // Setup code before each test
    }

    override func tearDownWithError() throws {
        // Teardown code after each test
    }

    // Test individual movie decoding
    func testMovieItem() throws {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let jsonData = movieJSON.data(using: .utf8)!
        
        // Ensure decoding does not throw an error
        XCTAssertNoThrow(try decoder.decode(Movie.self, from: jsonData), "Decoding the movie JSON should not throw an error")
        
        // Decode the movie object
        let movie: Movie = try decoder.decode(Movie.self, from: jsonData)
        
        // Check movie properties
        XCTAssertEqual(movie.id, 297761, "Movie ID should be 297761")
        XCTAssertEqual(movie.title, "Suicide Squad", "Movie title should be 'Suicide Squad'")
        XCTAssertEqual(movie.voteAverage, 5.91, "Movie vote average should be 5.91")
    }
    
    // Test decoding of a list of popular movies
    func testPopularMovieList() throws {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let jsonData = popularMoviesJSON.data(using: .utf8)!
        
        // Ensure decoding does not throw an error
        XCTAssertNoThrow(try decoder.decode(TrendingMovieList.self, from: jsonData), "Decoding the popular movies JSON should not throw an error")
        
        // Decode the list of movies
        let popularMovies: TrendingMovieList = try decoder.decode(TrendingMovieList.self, from: jsonData)
        
        // Check number of movies in the list
        XCTAssertEqual(popularMovies.results.count, 2, "There should be 2 movies in the list")
        
        // Check individual movie properties
        XCTAssertEqual(popularMovies.results[0].id, 297761, "First movie ID should be 297761")
        XCTAssertEqual(popularMovies.results[1].id, 324668, "Second movie ID should be 324668")
    }
}
