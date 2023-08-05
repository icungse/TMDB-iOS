//
//  PopularMoviesServiceMock.swift
//  TMDB-iOS
//
//  Created by Icung on 06/08/23.
//


struct PopularMoviesServiceMock: PopularMoviesFetcher {
    func fetchTrendingMovies(type: PopularRequest) async -> [Movie] {
        Movies.mock
    }
}
