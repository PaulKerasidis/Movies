//
//  CostumeImageView.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import SwiftUI

struct CostumeImageView: View {
    let itemWidth: CGFloat
    let itemHeight: CGFloat
    let movie: Movie
    let imageType: MovieImageType = .poster
    
    var body: some View {
        AsyncImage(url: URL(string: movie.getImage(for: imageType))) {image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ZStack {
                Color.AppGrayColor1
                
                Text(movie.title)
                    .poppins(.light)
                    .padding()
                    
            }
        }
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CostumeImageView(itemWidth: 150, itemHeight: 150, movie: .moviePreview)
}
