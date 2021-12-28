//
//  ContentView.swift
//  Corinews
//
//  Created by Dustin yang on 12/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            //                   SearchTabView()
            //                       .tabItem {
            //                           Label("Search", systemImage: "magnifyingglass")
            //                       }
            //
            //                   BookmarkTabView()
            //                       .tabItem {
            //                           Label("Saved", systemImage: "bookmark")
            //                       }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
