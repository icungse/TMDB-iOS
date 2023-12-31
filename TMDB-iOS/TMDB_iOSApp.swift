//
//  TMDB_iOSApp.swift
//  TMDB-iOS
//
//  Created by Icung on 03/08/23.
//

import SwiftUI

@main
struct TMDB_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                trendingMoviesViewModel: TrendingMoviesViewModel(
                    trendingMoviesFetcher: FetchTrendingMoviesService(
                        requestManager: RequestManager()
                    )
                ),
                popularMoviesViewModel: PopularMoviesViewModel(
                    popularMoviesFetcher: FetchPopularMoviesService(
                        requestManager: RequestManager()
                    )
                )
            )
        }
    }
}
