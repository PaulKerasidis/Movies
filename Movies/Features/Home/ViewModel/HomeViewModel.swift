//
//  HomeViewModel.swift
//  Movies
//
//  Created by Paulos Kerasidis on 20/1/25.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingRatedMovies: [Movie] = []
    @Published var erroeMsg = ""
    
    private let movieService = MovieService()
    
    func fetchTrendingMovies() async {
        do{
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint:
                    .trending))
            trendingRatedMovies = movieApiResponse.results
        }catch {
            erroeMsg = "Error: \(error)"
        }
    }
    
    func fetchTopRatedMovies() async {
        do{
            let movieApiResponse: MovieResponse = try await movieService.fetchData(api: ApiConstructor(endpoint:
                    .topRated))
            topRatedMovies = movieApiResponse.results
        }catch {
            erroeMsg = "Error: \(error)"
        }
    }
}
