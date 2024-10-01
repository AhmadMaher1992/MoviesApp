//
//  MoviesAppUITests.swift
//  MoviesAppUITests
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import XCTest

final class MoviesAppUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Stop the test immediately when a failure occurs.
        continueAfterFailure = false

        // Initialize the app instance before each test method
        app = XCUIApplication()

        // Launch the app for each test
        app.launch()

        // Set the initial state before the tests run
        // For example, setting interface orientation.
    }

    override func tearDownWithError() throws {
        // Clean up after each test method.
        app = nil
    }

    @MainActor
    func testMovieListScreenDisplaysCorrectly() throws {
        // This test will check if the main movie list screen displays correctly
        let movieListTitle = app.navigationBars["Top Rated Movies"]

        // Ensure that the movie list title is displayed
        XCTAssertTrue(movieListTitle.exists, "Movie list title should be visible")
        
        // Check for the existence of a movie item in the list
        let firstMovieCell = app.cells.element(boundBy: 0)
        XCTAssertTrue(firstMovieCell.exists, "At least one movie cell should be visible in the list")

        // Tap the first movie to go to the detail screen
        firstMovieCell.tap()

        // Check if the movie detail screen is displayed correctly
        let detailScreenTitle = app.staticTexts["MovieDetailTitle"] // Use accessibility identifier for title
        XCTAssertTrue(detailScreenTitle.exists, "Movie detail title should be visible")
    }

    @MainActor
    func testMovieDetailScreenDisplaysCorrectly() throws {
        // This test checks if the movie details screen shows all necessary information
        let firstMovieCell = app.cells.element(boundBy: 0)
        firstMovieCell.tap()

        // Verify movie poster exists
        let moviePoster = app.images["MoviePosterImage"] // Use accessibility identifier for poster
        XCTAssertTrue(moviePoster.exists, "Movie poster should be visible on the detail screen")

        // Verify movie title is shown
        let movieTitle = app.staticTexts["MovieDetailTitle"] // Use accessibility identifier for title
        XCTAssertTrue(movieTitle.exists, "Movie title should be visible")

        // Verify the release year is shown
        let releaseYear = app.staticTexts["ReleaseYear"] // Use accessibility identifier for release year
        XCTAssertTrue(releaseYear.exists, "Release year should be visible")

        // Verify the overview is shown
        let overview = app.staticTexts["OverviewText"] // Use accessibility identifier for overview
        XCTAssertTrue(overview.exists, "Overview text should be visible")

        // Check the homepage link if it exists
        if app.links["HomepageLink"].exists {
            let homepageLink = app.links["HomepageLink"] // Use accessibility identifier for homepage
            XCTAssertTrue(homepageLink.exists, "Homepage link should be visible if present")
        }
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This test measures the app launch time.
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                app.launch()
            }
        }
    }

    @MainActor
    func testMovieSearchFunctionality() throws {
        // This test checks if the search bar works correctly

        let searchField = app.searchFields["Search movies..."] // Use accessibility identifier for the search field
        XCTAssertTrue(searchField.exists, "Search field should be visible")
        
        // Tap and search for a movie
        searchField.tap()
        searchField.typeText("Suicide Squad")
        
        // Check if the correct search results are shown
        let searchResult = app.cells.staticTexts["Suicide Squad"] // Use the title as part of the search results
        XCTAssertTrue(searchResult.exists, "The movie 'Suicide Squad' should be visible in the search results")
        
        // Tap the search result to see the detail
        searchResult.tap()
        
        // Verify that the correct detail screen appears
        let detailScreenTitle = app.staticTexts["MovieDetailTitle"] // Use accessibility identifier
        XCTAssertTrue(detailScreenTitle.exists, "Movie detail screen should display 'Suicide Squad'")
    }
}
