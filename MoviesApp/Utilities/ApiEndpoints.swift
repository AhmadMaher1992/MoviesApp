//
//  ApiEndpoints.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import Foundation

enum ApiEndpoints {
    case moviePopular(page: Int)
    case movieDetail(id: Int)
}

extension ApiEndpoints: Endpoint {
    var path: String {
        switch self {
        case .moviePopular(let page):
            return "discover/movie?include_adult=false&sort_by=popularity.desc&page=\(page)"//this link isn't related to trending movies but you mention it in Task so i follow instructions 
        case .movieDetail(let id):
            return "movie/\(id)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .moviePopular, .movieDetail:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .moviePopular, .movieDetail:
            return [
                "Authorization": "Bearer \(API_KEY)",
                "Content-Type": "application/json;charset=utf-8"
            ]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .moviePopular, .movieDetail:
            return nil
        }
    }
}


enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}
