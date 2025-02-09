//
//  Genre.swift
//  Movies
//
//  Created by Paulos Kerasidis on 9/2/25.
//

import Foundation

struct Genre: Identifiable, Codable {
    let id: Int
    let name: String
}


struct GenreResponse: Codable {
    let genres: [Genre]
}
