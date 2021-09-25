//
//  Car.swift
//  instrumentAPPUI
//
//  Created by Dustin yang on 9/25/21.
//

import SwiftUI

struct Car: Identifiable{
    var id = UUID().uuidString
    var name: String
    var description: String
    var price: String
    var image: String
}

