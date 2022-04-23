//
//  ImageModel.swift
//  Await -
//
//  Created by Dustin yang on 4/23/22.
//

import SwiftUI

struct ImageModel: Identifiable, Codable, Hashable {
 
    var id : String
    var download_url : String
    
    enum CodingKeys: String, CodingKey {
        case id
        case download_url
    }
    
    
}

