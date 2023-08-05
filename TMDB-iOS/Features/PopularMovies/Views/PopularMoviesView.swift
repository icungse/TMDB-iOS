//
//  PopularMoviesView.swift
//  TMDB-iOS
//
//  Created by Icung on 05/08/23.
//

import SwiftUI

struct PopularMoviesView: View {
    @State private var selection = "Streming"
    let trendingTimes = ["Streming", "On TV", "In Theatres"]
    
    @ObservedObject var viewModel: PopularMoviesViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text("What's Popular")
                    .bold()
                    .font(.title)
                Picker("Select Type", selection: $selection) {
                    ForEach(trendingTimes, id: \.self) {
                        Text($0)
                    }
                }
                .onChange(of: selection) { newValue in
                    var type = PopularRequest.streaming
                    switch newValue {
                    case "On TV":
                        type = .onTv
                    case "In Theatres":
                        type = .inTheatres
                    default:
                        type = .streaming
                    }
                    
                    loadData(type)
                }
                .pickerStyle(.menu)
            }
            
            MovieList(movies: viewModel.movies)
        }
        .task {
            loadData(.inTheatres)
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
    
    func loadData(_ time: PopularRequest) {
        Task {
            await viewModel.fetchTrendingMovies(type: time)
        }
    }
}

struct PopularMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView(
            viewModel: PopularMoviesViewModel(
                popularMoviesFetcher: PopularMoviesServiceMock()
            )
        )
    }
}
