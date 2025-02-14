//
//  ReviewCard.swift
//  Movies
//
//  Created by Paulos Kerasidis on 14/2/25.
//

import SwiftUI

struct ReviewCard: View {
    let review: Review
    
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                AsyncImage(url: URL(string: review.authorImage)){ image in
                    image
                        .resizable()
                } placeholder: {
                    ZStack{
                        Color.AppGrayColor1
                        
                        
                        if let firstCharacter = review.author.first{
                            Text(String(firstCharacter))
                        }
                    }
                }
                .scaledToFill()
                .frame(width: 45.0, height: 45.0)
                .clipShape(Circle())
                
                Text(review.author)
                    .poppins(.medium, 16)
            }
            
            Text(review.content)
                .poppins(.light)
            Divider()
        }
    }
}

#Preview {
    ReviewCard(review: reviewPreview)
}
