//
//  GenreCard.swift
//  Movies
//
//  Created by Paulos Kerasidis on 9/2/25.
//

import SwiftUI

struct GenreCard: View {
    let genre: Genre
    let nameSpace: Namespace.ID
    @Binding var selectedGenre: Genre
    
    var body: some View {
        Text(genre.name)
            .poppins(genre.id == selectedGenre.id ? .bold : .medium, 18)
            .background(
                ZStack {
                    if genre.id == selectedGenre.id {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.AppGrayColor1)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "Genre", in: nameSpace)
                    }
                }
            )
            .padding()
    }
}

#Preview {
    GenreCard(genre: genrePreview, nameSpace: Namespace().wrappedValue, selectedGenre: .constant(genrePreview))
}
