//
//  PopularMoviesViewModel.swift
//  TMDB-iOS
//
//  Created by Icung on 05/08/23.
//

import Foundation

protocol PopularMoviesFetcher {
    func fetchTrendingMovies(type: PopularRequest) async -> [Movie]
}

@MainActor
class PopularMoviesViewModel: ObservableObject {
    @Published var isLoading: Bool
    @Published var movies: [Movie] = []
    
    private let popularMoviesFetcher: PopularMoviesFetcher
    
    init(isLoading: Bool = true, popularMoviesFetcher: PopularMoviesFetcher) {
        self.isLoading = isLoading
        self.popularMoviesFetcher = popularMoviesFetcher
    }
    
    func fetchTrendingMovies(type: PopularRequest) async {
        isLoading = true
        movies = await popularMoviesFetcher.fetchTrendingMovies(type: type)
        isLoading = false
    }
}

