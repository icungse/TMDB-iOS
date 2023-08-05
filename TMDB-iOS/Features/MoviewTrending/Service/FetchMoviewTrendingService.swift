//
//  FetchTrendingMoviesService.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

struct FetchTrendingMoviesService {
    private let requestManager: RequestManagerProtocol
    
    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension FetchTrendingMoviesService: TrendingMoviesFetcher {
    func fetchTrendingMovies(trend: TrendingMoviesRequest) async -> [Movie] {
        let requestData = trend
        do {
            let data: Movies = try await requestManager.perform(requestData)
            return data.movies
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
