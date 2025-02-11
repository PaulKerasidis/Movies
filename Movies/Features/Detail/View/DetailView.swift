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
    
    var body: some View{
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                CostumeImageView(itemWidth: screenWidth, itemHeight: posterImageHeight, movie: vm.movie)
            }
        }
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.35
    }
}

#Preview {
    DetailView(movie: .moviePreview )
}
