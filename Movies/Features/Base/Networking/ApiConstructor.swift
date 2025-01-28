//
//  ApiConstructor.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import Foundation

typealias Parameters = [String: String]

struct ApiConstructor {
    let endpoint: Endpoint
    var params: Parameters = [:]
}
