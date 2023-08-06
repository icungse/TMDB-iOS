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
    
    @StateObject var tabNavigator = TMDBTabNavigator()
    
    var body: some View {
        TabView(selection: $tabNavigator.currentTab) {
            HomeView(
                trendingMoviesViewModel: trendingMoviesViewModel,
                popularMoviesViewModel: popularMoviesViewModel
            )
            .tag(TMDBTabType.home)
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            FavoriteView()
                .tag(TMDBTabType.favorite)
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
            WatchlistView()
                .tag(TMDBTabType.watchlist)
                .tabItem {
                    Label("Watchlist", systemImage: "list.bullet")
                }
            
            ProfileView()
                .tag(TMDBTabType.profile)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
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
