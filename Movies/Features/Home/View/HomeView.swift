//
//  HomeView.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @StateObject private var vm = HomeViewModel()
    @Namespace var namespace
    var body: some View {
        ScrollView(showsIndicators: false){
            LazyVStack(alignment: .leading, spacing: 20){
                Text("What do you want to watch?")
                    .poppins(.bold, 20)
                
                SearchBar(searchText: $searchText)
                    
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(vm.trendingRatedMovies){ movie in
                            MovieCard(movie: movie)
                                .onTapGesture {
                                    vm.selectedMovie = movie
                                }
                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(vm.genre){ genre in
                            GenreCard(genre: genre, nameSpace: namespace, selectedGenre: $vm.selectedGenre)
                                .onTapGesture {
                                    withAnimation(.easeOut){
                                        vm.selectedGenre = genre
                                        Task{
                                            await vm.fetchMoviesForSelectedGenre()
                                        }
                                    }
                                }
                        }
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),],spacing: 20){
                    ForEach(vm.moviesForSelectedGenre){ movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.AppBackgroundColor)
        .fullScreenCover(item: $vm.selectedMovie) {movie in
            DetalView(movie: movie)
        }
        .task{
            await vm.fetchTrendingMovies()
            await vm.fetchTopRatedMovies()
            await vm.fetchGenre()
            await vm.fetchMoviesForSelectedGenre()
        }
    }
}

#Preview {
    HomeView()
}
