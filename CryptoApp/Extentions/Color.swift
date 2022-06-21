//
//  Color.swift
//  CryptoApp
//
//  Created by Dustin yang on 6/20/22.
//

import SwiftUI
import Foundation
extension Color {
    static let theme = ColorTheme()
}



struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let secondaryText = Color("SecondaryTextColor")
}
