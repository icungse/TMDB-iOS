//
//  TMDBTabNavigator.swift
//  TMDB-iOS
//
//  Created by Icung on 06/08/23.
//

import Foundation

class TMDBTabNavigator: ObservableObject {
    @Published var currentTab: TMDBTabType = .home
    
    func switchType(to tab: TMDBTabType) {
        currentTab = tab
    }
}

extension TMDBTabNavigator: Hashable {
    static func == (lhs: TMDBTabNavigator, rhs: TMDBTabNavigator) -> Bool {
        lhs.currentTab == rhs.currentTab
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(currentTab)
    }
}
