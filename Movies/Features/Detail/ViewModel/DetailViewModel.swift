//
//  DetailViewModel.swift
//  Movies
//
//  Created by Paulos Kerasidis on 11/2/25.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    let movie : Movie
    let sections: [DetailViewSection] = [.about, .review]
    @Published var selectedSection: DetailViewSection = .about
    @Published var reviews: [Review] = []
    
    @Published var errorMsg = ""
    
    private let movieService = MovieService()
    
    init(movie : Movie) {
        self.movie = movie
    }
    
    func fetchReviews() async{
        do {
            let response: ReviewResponse = try await movieService.fetchData(api: ApiConstructor(endpoint: .movieReviews(movie.id)))
            reviews = response.results
        } catch {
            print("Error: \(error)")
            errorMsg = "Error \(error)"
        }
    }
    
}
