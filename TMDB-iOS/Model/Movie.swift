//
//  Movie.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

import Foundation

struct Movie: Codable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let id: Int?
    let title: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let mediaType: MediaType?
    let genreIDS: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

extension Movie {
    var posterUrl: URL? {
        get {
            guard let posterPath = posterPath else {
                return nil
            }
            let fullUrl = "\(APIConstants.imageHost)\(posterPath)"
            return URL(string: fullUrl)
        }
    }
    
    var releaseDateFormatted: String {
        get {
            return (releaseDate ?? firstAirDate)?.formatDate() ?? ""
        }
    }
    
}
