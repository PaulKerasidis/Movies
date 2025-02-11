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
                ZStack(alignment: .top) {
                    CustomeImageView(itemWidth: screenWidth, itemHeight: posterImageHeight, movie: vm.movie)
                    
                    HStack{
                        Image.BackIcon
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                        Text("Details")
                        Spacer()
                        Image.BookmarkIcon
                    }
                    .padding()
                    .background(Color.AppBackgroundColor)
                }
                
                HStack{
                    CustomeImageView(itemWidth: backDropImageSize, itemHeight: backDropImageSize, movie: vm.movie, imageType: .backdrop)
                    
                    Text(vm.movie.title)
                        .minimumScaleFactor(0.5)
                        .padding(.top, tittleOffset)
                }
                .padding()
                .offset(y: backDropImageOffset)
            }
            Spacer()
        }
        .preferredColorScheme(.dark)
        .background(Color.appBackground)
    }
    
    var posterImageHeight: CGFloat {
        screenHeight * 0.35
    }
    
    var backDropImageSize: CGFloat {
        screenHeight * 0.22
    }
    
    var backDropImageOffset: CGFloat {
        screenHeight * 0.15
    }
    
    var tittleOffset: CGFloat {
        screenHeight * 0.12
    }
}

#Preview {
    DetailView(movie: .moviePreview )
}
