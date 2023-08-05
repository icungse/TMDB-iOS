//
//  Movies.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

import Foundation

struct Movies: Codable {
    let page: Int?
    let movies: [Movie]
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
