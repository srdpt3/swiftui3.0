//
//  Category.swift
//  Corinews
//
//  Created by Dustin yang on 12/26/21.
//
import Foundation

enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    
    var text: String {
        if self == .general {
            return "헤드라인"
        }
        if self == .business {
            return "비지니스"
        }
        if self == .technology {
            return "코인뉴스"
        }
        if self == .entertainment {
            return "엔터"
        }
        
        if self == .sports {
            return "스포츠"
        }
        if self == .science {
            return "사이언스"
        }
        if self == .health {
            return "건강"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
