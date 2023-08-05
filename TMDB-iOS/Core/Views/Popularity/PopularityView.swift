//
//  PopularityView.swift
//  TMDB-iOS
//
//  Created by Icung on 05/08/23.
//

import SwiftUI

struct PopularityView: View {
    let popularity: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.green.opacity(0.5),
                    lineWidth: 5
                )
                .background(
                    Circle().foregroundColor(.black)
                )
                
            Circle()
                .trim(from: 0, to: popularity)
                .stroke(
                    Color.green,
                    lineWidth: 5
                )
                .rotationEffect(.degrees(-90))
            Text("66\"")
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 50, height: 50)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        PopularityView(popularity: 0.5)
    }
}
