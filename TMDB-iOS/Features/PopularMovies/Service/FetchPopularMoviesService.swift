//
//  FetchPopularMoviesService.swift
//  TMDB-iOS
//
//  Created by Icung on 06/08/23.
//

import Foundation

struct FetchPopularMoviesService {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension FetchPopularMoviesService: PopularMoviesFetcher {
    func fetchTrendingMovies(type: PopularRequest) async -> [Movie] {
        let requestData = type
        do {
            let data: Movies = try await requestManager.perform(requestData)
            return data.movies
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
