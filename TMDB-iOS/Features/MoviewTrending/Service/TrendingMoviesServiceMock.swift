//
//  TrendingMoviesServiceMock.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

struct TrendingMoviesServiceMock: TrendingMoviesFetcher {
    func fetchTrendingMovies(trend: TrendingMoviesRequest) async -> [Movie] {
        Movies.mock
    }
}

