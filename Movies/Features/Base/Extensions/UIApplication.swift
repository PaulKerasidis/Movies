//
//  UIApplication.swift
//  Movies
//
//  Created by Paulos Kerasidis on 19/1/25.
//

import SwiftUI

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
