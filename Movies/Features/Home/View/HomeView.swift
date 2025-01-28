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
                        }
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),],spacing: 20){
                    ForEach(vm.topRatedMovies){ movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.AppBackgroundColor)
        .task{
            await vm.fetchTrendingMovies()
            await vm.fetchTopRatedMovies()
        }
    }
}

#Preview {
    HomeView()
}
