//
//  MovieCard.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    var type: MovieCardType = .poster
    
    var body: some View {
        CostumeImageView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
    }
}

extension MovieCard {
    var itemWidth: CGFloat {
        screenWidth * type.widthPercent
    }
    var itemHeight: CGFloat {
        screenWidth * type.heightPercent
    }
}

#Preview {
    MovieCard(movie: .moviePreview)
}
