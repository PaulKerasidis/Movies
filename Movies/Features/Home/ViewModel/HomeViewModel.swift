//
//  HomeViewModel.swift
//  Movies
//
//  Created by Paulos Kerasidis on 20/1/25.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingRatedMovies: [Movie] = []
    @Published var moviesForSelectedGenre: [Movie] = []
    @Published var genre: [Genre] = []
    @Published var erroeMsg = ""
    @Published var selectedGenre = Genre(id: 28, name: "Action")
    
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
    
    func fetchGenre() async {
        do{
            let genreApiResponse: GenreResponse = try await movieService.fetchData(api: ApiConstructor(endpoint:
                    .genre))
            genre = genreApiResponse.genres
            if let genre = genre.first {
                selectedGenre = genre
            }
        }catch {
            erroeMsg = "Error: \(error)"
        }
    }
    
    func fetchMoviesForSelectedGenre() async {
        do{
            let selectedGenreApi = ApiConstructor(endpoint: .discoverMovies, params: [
                "with_genres": "\(selectedGenre.id)"
            ])
            let response: MovieResponse = try await movieService.fetchData(api: selectedGenreApi)
            moviesForSelectedGenre = response.results
        }catch {
            erroeMsg = "Error: \(error)"
        }
    }
    
}

