//
//  DetailViewModel.swift
//  Movies
//
//  Created by Paulos Kerasidis on 11/2/25.
//

import Foundation

class DetailViewModel: ObservableObject {
    let movie : Movie
    let sections: [DetailViewSection] = [.about, .review]
    @Published var selectedSection: DetailViewSection = .about
    
    init(movie : Movie) {
        self.movie = movie
    }
    
}
