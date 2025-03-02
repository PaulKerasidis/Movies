//
//  MovieCardType.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import Foundation

enum MovieCardType{
    case poster, grid
}


extension MovieCardType{
    var widthPercent: Double{
        switch self {
        case .poster:
            return 0.45
        case .grid:
            return 0.30
        }
    }
    var heightPercent: Double{
        switch self {
        case .poster:
            return 0.60
        case .grid:
            return 0.30
        }
    }
    
}
