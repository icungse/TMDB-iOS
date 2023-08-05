//
//  PopularRequest.swift
//  TMDB-iOS
//
//  Created by Icung on 05/08/23.
//

enum PopularRequest: RequestProtocol {
    case streaming
    case onTv
    case inTheatres
    
    var path: String {
        switch self {
        case .streaming:
            return "/3/trending/all/day"
        case .onTv:
            return "/3/tv/on_the_air"
        case .inTheatres:
            return "/3/movie/now_playing"
        }
    }
    
    var requestType: RequestType {
        .GEt
    }
}

