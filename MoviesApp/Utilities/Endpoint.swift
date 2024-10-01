//
//  Endpoint.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://api.themoviedb.org/3/"
    }
}
