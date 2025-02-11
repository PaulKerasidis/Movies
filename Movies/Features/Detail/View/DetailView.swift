//
//  DetalView.swift
//  Movies
//
//  Created by Paulos Kerasidis on 11/2/25.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var vm : DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(movie: Movie) {
        _vm = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DetailView(movie: dev.movie)
}
