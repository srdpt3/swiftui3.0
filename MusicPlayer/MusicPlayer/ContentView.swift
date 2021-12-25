//
//  ContentView.swift
//  MusicPlayer
//
//  Created by Dustin yang on 10/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = Model.shared
    
    var body: some View {
        TabView{
            PlayListView()
                .environmentObject(model)
                .tabItem {
                    VStack{
                        Image(systemName: "music.note.list")
                        Text("Playlists")
                    }
                }
            
            LibraryListView()
                .environmentObject(model)
                .tabItem {
                    VStack{
                        Image(systemName: "music.note")
                        Text("Library")
                    }
                }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
