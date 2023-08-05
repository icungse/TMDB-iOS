//
//  MoviesMock.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

import Foundation

private struct MovieMock: Codable {
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
    
    let jsonMock = try? decoder.decode(MovieMock.self, from: data)
    return jsonMock?.results ?? []
}

extension Movie {
    static let mock = loadMovies()[0]
}
