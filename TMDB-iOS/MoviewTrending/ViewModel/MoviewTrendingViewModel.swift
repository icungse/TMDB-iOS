//
//  TrendingMoviesViewModel.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

import Foundation

protocol TrendingMoviesFetcher {
    func fetchTrendingMovies(trend: TrendingMoviesRequest) async -> [Movie]
}

@MainActor
class TrendingMoviesViewModel: ObservableObject {
    @Published var isLoading: Bool
    @Published var movies: [Movie] = []
    
    private let trendingMoviesFetcher: TrendingMoviesFetcher
    
    init(isLoading: Bool = true, trendingMoviesFetcher: TrendingMoviesFetcher) {
        self.isLoading = isLoading
        self.trendingMoviesFetcher = trendingMoviesFetcher
    }
    
    func fetchTrendingMovies(trend: TrendingMoviesRequest) async {
        isLoading = true
        movies = await trendingMoviesFetcher.fetchTrendingMovies(trend: trend)
        isLoading = false
    }
}

