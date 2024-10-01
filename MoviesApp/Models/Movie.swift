//
//  Movie.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import Foundation

struct Movie: Identifiable, Codable {
    
    let posterPath: String
    let adult: Bool
    let overview: String
    let releaseDate: String?
    let id: Int
    let originalTitle: String
    let originalLanguage: String
    let title: String
    let voteCount: Int?
    let popularity: Float?
    let voteAverage: Double?
    let runtime: Int?
    let status: String?
    let video: Bool?
    let genres: [MovieGenre]?
    var character: String?
    var department: String?
    
    let vote_average: Float?
    var genreText: String {
        genres?.first?.name ?? "n/a"
    }
    
    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    static private let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
    var ratingText: String {
        let rating = Int(voteAverage ?? 0.0)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
    
    var yearText: String {
        guard let releaseDate = self.releaseDate, let date = Movie.dateFormatter.date(from: releaseDate) else {
            return "n/a"
        }
        return Movie.yearFormatter.string(from: date)
    }
    
    
    var durationText: String {
        guard let runtime = self.runtime, runtime > 0 else {
            return "n/a"
        }
        return Movie.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
    }
    
}
struct MovieGenre: Codable {
    let id: Int
    let name: String
}
