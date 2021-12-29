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
                    Label("뉴스", systemImage: "newspaper")
                }
            
            SearchTabView()
                .tabItem {
                    Label("검색", systemImage: "magnifyingglass")
                }
            
            BookmarkTabView()
                .tabItem {
                    Label("북마크", systemImage: "bookmark")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
