//
//  Poppins.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import Foundation

enum Poppins: String {
    case black, bold, medium, regular, light, semiBold

    var fontName: String {
        "Poppins-\(self.rawValue.capitalized)" // Popppins-SemiBold
    }
}
