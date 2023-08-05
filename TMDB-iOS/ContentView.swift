//
//  ContentView.swift
//  TMDB-iOS
//
//  Created by Icung on 03/08/23.
//

import SwiftUI

struct ContentView: View {
    let trendingMoviesViewModel: TrendingMoviesViewModel
    let popularMoviesViewModel: PopularMoviesViewModel
    
    init(trendingMoviesViewModel: TrendingMoviesViewModel, popularMoviesViewModel: PopularMoviesViewModel) {
        self.trendingMoviesViewModel = trendingMoviesViewModel
        self.popularMoviesViewModel = popularMoviesViewModel
    }
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 24) {
                TrendingMoviesView(
                    viewModel: trendingMoviesViewModel
                )
                .frame(height: 400)
                
                PopularMoviesView(
                    viewModel: popularMoviesViewModel
                )
                .frame(height: 400)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            trendingMoviesViewModel: TrendingMoviesViewModel(
                trendingMoviesFetcher: TrendingMoviesServiceMock()
            ),
            popularMoviesViewModel: PopularMoviesViewModel(
                popularMoviesFetcher: PopularMoviesServiceMock()
            )
        )
    }
}
