//
//  MusicPlayerApp.swift
//  MusicPlayer
//
//  Created by Dustin yang on 10/13/21.
//

import SwiftUI
import StoreKit
import MediaPlayer

@main
struct MusicPlayerApp: App {
//    let persistenceController = PersistenceController.shared

    @Environment(\.scenePhase) var scenePhase
    
    init(){
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onChange(of: scenePhase, perform: { value in
                    if value == .active {
                        SKCloudServiceController.requestAuthorization { status in
                            if status == .authorized {
                                let songQuery = MPMediaQuery.songs()
                                if let songs = songQuery.items {
                                    let desc = NSSortDescriptor(key: MPMediaItemPropertyLastPlayedDate, ascending: false)
                                    let sortedSongs = NSArray(array: songs).sortedArray(using: [desc])
                                    Model.shared.librartSongs = sortedSongs as! [MPMediaItem]
                                }
                                
                                let playListQuery = MPMediaQuery.playlists()
                                if let playlists = playListQuery.collections {
                                    Model.shared.playlists = playlists
                                }
                            }
                        }
                    }
                    
                })
        }
    }
}
