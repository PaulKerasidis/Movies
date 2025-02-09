//
//  PreviewProvider.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import SwiftUI

extension Movie {
    static let moviePreview = Movie(
        backdropPath: "/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg",
        id: 12345,
        title: "The Shawshank Redemption",
        originalTitle: "Inception",
        overview: "A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
        posterPath: "/path/to/poster.jpg",
        mediaType: "movie",  // Added the missing mediaType
        adult: false,
        originalLanguage: "en",
        genreIds: [28, 12, 878],  // Note: genreIds not genreIDS
        popularity: 84.5,
        releaseDate: "2010-07-16",
        video: false,
        voteAverage: 8.8,
        voteCount: 29847
    )
}

let genre = Genre(id: 28, name: "Action")
