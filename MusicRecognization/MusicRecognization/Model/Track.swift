//
//  Track.swift
//  MusicRecognization
//
//  Created by Dustin yang on 10/8/21.
//

import SwiftUI

struct Track: Identifiable {
    var id = UUID().uuidString
    // Track Info...
    var title: String
    var artist: String
    var artwork: URL
    var genres: [String]
    var appleMusicURL: URL
}
