//
//  String.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import Foundation


extension String {
    var capitalizedFirstLetter: String {
        if self.count == 0 {return self}
        return prefix(1).uppercased() + dropFirst()
    }
}
