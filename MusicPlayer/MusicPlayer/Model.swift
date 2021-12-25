//
//  Model.swift
//  MusicPlayer
//
//  Created by Dustin yang on 10/13/21.
//

import Foundation
import MediaPlayer

class Model : ObservableObject {
    static let shared = Model()
    @Published var currentSong : MPMediaItem?
    @Published var playlists = [MPMediaItemCollection]()
    @Published var librartSongs = [MPMediaItem]()

    
}
