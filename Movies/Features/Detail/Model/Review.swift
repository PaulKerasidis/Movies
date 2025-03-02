//
//  Review.swift
//  Movies
//
//  Created by Paulos Kerasidis on 13/2/25.
//

import Foundation

// MARK: - ReviewResponse
struct ReviewResponse: Codable {
    let results: [Review]
}

// MARK: - Review
struct Review: Codable, Identifiable {
    let author: String
    let authorDetails: AuthorDetails?
    let content, createdAt, id, updatedAt: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
}

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}

extension Review {
    var authorName: String {
        authorDetails?.authorName ?? author
    }
    
    var authorImage: String {
        var image = authorDetails?.avatarPath ?? ""
        if image.starts(with: "/") {
            image = String(image.dropFirst())
        }
        return image
    }
}

extension AuthorDetails {
    var authorName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? username : name
    }
}
