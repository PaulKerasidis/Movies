//
//  DetailViewModel.swift
//  Movies
//
//  Created by Paulos Kerasidis on 11/2/25.
//

import Foundation

class DetailViewModel: ObservableObject {
    
    let movie : Movie
    
    init(movie : Movie) {
        self.movie = movie
    }
    
}
