//
//  TrendingRequest.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

import Foundation

enum TrendingMoviesRequest: RequestProtocol {
    case daily
    case weekly
    var path: String {
        switch self {
        case .daily:
            return "/3/trending/all/day"
        case .weekly:
            return "/3/trending/all/week"
        }
    }
    
    var requestType: RequestType {
        .GEt
    }
}
