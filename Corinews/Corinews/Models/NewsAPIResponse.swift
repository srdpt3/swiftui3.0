//
//  NewsAPIResponse.swift
//  Corinews
//
//  Created by Dustin yang on 12/25/21.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
