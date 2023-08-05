//
//  TrendingMoviesView.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

import SwiftUI

struct TrendingMoviesView: View {
    @ObservedObject var viewModel: TrendingMoviesViewModel
    @State private var selection = "Today"
    let trendingTimes = ["Today", "This Week"]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text("Trending")
                    .bold()
                    .font(.title)
                Picker("Select a paint color", selection: $selection) {
                    ForEach(trendingTimes, id: \.self) {
                        Text($0)
                    }
                }
                .onChange(of: selection) { newValue in
                    var time = TrendingMoviesRequest.daily
                    switch newValue {
                    case "This Week":
                        time = .weekly
                    default:
                        time = .daily
                    }
                    loadData(time)
                }
                .pickerStyle(.menu)
            }
            
            MovieList(movies: viewModel.movies)
        }
        .task {
            loadData(.daily)
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
    
    func loadData(_ time: TrendingMoviesRequest) {
        Task {
            await viewModel.fetchTrendingMovies(trend: time)
        }
    }
}

struct TrendingMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingMoviesView(
            viewModel: TrendingMoviesViewModel(
                trendingMoviesFetcher: TrendingMoviesServiceMock()
            )
        )
    }
}
