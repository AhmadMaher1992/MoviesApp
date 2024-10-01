//
//  Formatter.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import Foundation


// Helper function to format numbers with commas
extension Int {
    func formattedWithSeparator() -> String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}
extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}
