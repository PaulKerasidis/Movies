//
//  Movie.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import Foundation



struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Codable, Identifiable {
    let backdropPath: String?
    let id: Int      // This property satisfies Identifiable requirement
    let title: String
    let originalTitle: String
    let overview: String
    let posterPath: String?
    let mediaType: String?
    let adult: Bool
    let originalLanguage: String
    let genreIds: [Int]
    let popularity: Double
    let releaseDate: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult
        case originalLanguage = "original_language"
        case genreIds = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
extension Movie {
    var imageUrlString: String {
        Constants.imageBaseUrl + posterPath.stringValue
    }
    
    func getImage(for type: MovieImageType)-> String{
        switch type {
        case .backdrop:
            return Constants.imageBaseUrl + (posterPath == nil ? backdropPath.stringValue : posterPath.stringValue)
        case .poster:
            return Constants.imageBaseUrl + (backdropPath == nil ? posterPath.stringValue : backdropPath.stringValue)
        }
        
    }
}

enum MovieImageType{
    case backdrop,poster
}
