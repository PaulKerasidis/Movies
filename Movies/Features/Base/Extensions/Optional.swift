//
//  Optional.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import Foundation


extension Optional where Wrapped == String{
    var stringValue: String{
        guard let self = self else {  return "" }
        return self
    }
}
