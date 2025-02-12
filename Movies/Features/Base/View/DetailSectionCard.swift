//
//  DetailSectionCard.swift
//  Movies
//
//  Created by Paulos Kerasidis on 12/2/25.
//

import SwiftUI

struct DetailSectionCard: View {
    let section: DetailViewSection
    let namespace: Namespace.ID
    @Binding var selectedSection: DetailViewSection
    
    var body: some View {
        Text(section.rawValue)
            .poppins(.medium, 16)
            .background(
                ZStack {
                    if section == selectedSection {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "DetailsSectionCard", in: namespace)
                    }
                }
            )
            .padding()
    }
}

#Preview {
    DetailSectionCard(section: .about, namespace: Namespace().wrappedValue, selectedSection: .constant(.about))
}
