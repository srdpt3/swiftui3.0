//
//  LibraryListView.swift
//  MusicPlayer
//
//  Created by Dustin yang on 10/16/21.
//

import SwiftUI

struct LibraryListView: View {
    @EnvironmentObject var model : Model
    var body: some View {
        NavigationView{
            List{
                ForEach(model.librartSongs, id:\.self) { playlist in
                    PlayListCardView()
                    
                }
            }
        }
    }
}

struct LibraryListView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryListView()
    }
}
