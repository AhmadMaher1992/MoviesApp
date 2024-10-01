//
//  SplashScreen.swift
//  MoviesApp
//
//  Created by Ahmad Eisa on 02/10/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            // Navigate to your main app content after the splash screen
            TrendingMovies(viewModel: TrendingMovies.ViewModel.init())
        } else {
            VStack {
                // Your custom icon or logo representing the app (e.g., a movie-related icon)
                Image(systemName: "film") // You can use a custom image instead
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.purple) // Icon color is now purple
                
                Text("MoviesApp")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple) // Text color is also purple to match
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                // Animate the icon
                withAnimation(.easeIn(duration: 1.2)) {
                    self.size = 1.0
                    self.opacity = 1.0
                }
                // Delay navigation to the main screen
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
