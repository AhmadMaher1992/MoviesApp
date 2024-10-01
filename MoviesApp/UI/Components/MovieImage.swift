//
//  MovieImage.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 01/10/2024.
//

import SwiftUI

struct MovieImage: View {
    var path: String = ""
    var width: CGFloat = 50
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(path)")) { image in
            image.resizable().scaledToFit()
                   } placeholder: {
                       Image(systemName: "camera.fill")
                   }
                   .frame(width: width, alignment: .center)
                   .cornerRadius(10)
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        MovieImage(path: "")
    }
}
