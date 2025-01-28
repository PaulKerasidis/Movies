//
//  SearchBar.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        TextField("Search", text: $searchText)
            .overlay(
                ZStack {
                    Image.CancelIcon
                        .foregroundColor(.white)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared.endEditing()
                        }
                        
                    Image.SearchIcon
                        .opacity(searchText.isEmpty ? 1.0 : 0.0)
                }
                , alignment: .trailing)
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.AppGrayColor1)
            )
    }
}

#Preview {
    SearchBar(searchText: .constant(""))
}
