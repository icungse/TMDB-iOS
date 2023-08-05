//
//  ContentView.swift
//  TMDB-iOS
//
//  Created by Icung on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TrendingMoviesView(
                viewModel: TrendingMoviesViewModel(
                    trendingMoviesFetcher: FetchTrendingMoviesService(
                        requestManager: RequestManager()
                    )
                )
            )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
