//
//  Post.swift
//  DoubleSidedGallery
//
//  Created by Dustin yang on 10/12/21.
//


import SwiftUI

struct Post: Identifiable,Hashable {
    var id = UUID().uuidString
    var imageURL: String
}
