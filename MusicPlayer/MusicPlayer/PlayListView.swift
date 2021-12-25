//
//  PlayListView.swift
//  MusicPlayer
//
//  Created by Dustin yang on 10/16/21.
//

import SwiftUI

struct PlayListView: View {
    
    @EnvironmentObject var model : Model
    var body: some View {
        NavigationView{
            List{
                ForEach(model.playlists, id:\.self) { playlist in
                    PlayListCardView()
                    
                }
            }
        }
    }
}

struct PlayListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayListView()
    }
}
