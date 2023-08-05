//
//  MovieList.swift
//  TMDB-iOS
//
//  Created by Icung on 06/08/23.
//

import SwiftUI

struct MovieList: View {
    var movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 8) {
                ForEach(movies) { movie in
                    CardView(movie: movie)
                        .frame(maxHeight: 400, alignment: .top)
                        .padding(.all, 0)
                }
            }
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        let movies = Movies.mock
        MovieList(movies: movies)
    }
}
