//
//  DetalView.swift
//  Movies
//
//  Created by Paulos Kerasidis on 11/2/25.
//

import SwiftUI

enum DetailViewSection: String{
    case about, review
    
    var rawValue: String{
        switch self{
        case .about:
            return "About Movie"
        case .review:
            return "Reviews"
        }
    }
}


struct DetailView: View {
    @StateObject private var vm : DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @Namespace var namespace
    
    init(movie: Movie) {
        _vm = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    
    var body: some View{
        VStack(alignment: .leading) {
            header
            VStack{
                
                HStack{
                    Image.CalendarIcon
                    Text(vm.movie.releaseDate ?? "Unknown")
                    Text("|")
                    Image.ClockIcon
                    Text("148 minutes")
                    Text("|")
                    Image.GenreIcon
                    Text("Action")
                }
                .foregroundColor(.AppGrayColor2)
                .frame(maxWidth: .infinity)
                
                HStack {
                    ForEach(vm.sections, id: \.self){ section in
                        DetailSectionCard(section: section, namespace: namespace, selectedSection: $vm.selectedSection)
                            .onTapGesture {
                                withAnimation(.easeInOut){
                                    vm.selectedSection = section
                                }
                            }
                    }
                    
                    switch vm.selectedSection {
                    case .about:
                        Text(vm.movie.overview)
                    case .review:
                        Text("Review")
                    }
                    
                }
                
                Spacer()
            }
            .padding()
            .padding(.top, contentOffset)
        }
        .preferredColorScheme(.dark)
        .background(Color.appBackground)
        .task {
            await vm.fetchReviews()
        }
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
    
    var contentOffset: CGFloat {
        screenHeight * 0.10
    }
}

private extension DetailView{
    var header: some View{
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
    }
    
}
    


#Preview {
    DetailView(movie: .moviePreview )
}
