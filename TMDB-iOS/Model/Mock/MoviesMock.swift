//
//  MoviesMock.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

import Foundation

private struct MoviesMock: Codable {
    let results: [Movie]
}

private func loadMovies() -> [Movie] {
    guard
        let url = Bundle.main.url(
            forResource: "MoviesMock",
            withExtension: "json"
        ),
        let data = try? Data(contentsOf: url)
    else {
        return []
    }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .useDefaultKeys
    
    let jsonMock = try? decoder.decode(MoviesMock.self, from: data)
    return jsonMock?.results ?? []
}

extension Movies {
    static let mock = loadMovies()
}
