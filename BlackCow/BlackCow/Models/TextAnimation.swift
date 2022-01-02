//
//  TextAnimation.swift
//  BlackCow
//
//  Created by Dustin yang on 12/29/21.
//

import SwiftUI

struct TextAnimation: Identifiable {
    var id = UUID().uuidString
    var text: String
    var offset: CGFloat = 110
}
