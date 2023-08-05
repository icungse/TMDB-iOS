//
//  CardView.swift
//  TMDB-iOS
//
//  Created by Icung on 04/08/23.
//

import SwiftUI

struct CardView: View {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                CacheAsyncImage(
                    url: movie.posterUrl,
                    content: { image in
                        image.image?.resizable()
                })
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 225)
                
                PopularityView(popularity: 0.3)
                    .padding(.top, -25)
                    .padding(.leading, 9)
            }
            
            Text(movie.title ?? movie.name ?? "")
                .lineLimit(2)
                .font(.title3)
                .bold()
            Text(movie.releaseDateFormatted)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: 150)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(movie: Movie.mock)
    }
}
