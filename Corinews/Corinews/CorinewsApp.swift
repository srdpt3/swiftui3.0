//
//  CorinewsApp.swift
//  Corinews
//
//  Created by Dustin yang on 12/25/21.
//

import SwiftUI

@main
struct CorinewsApp: App {
    
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(articleBookmarkVM)
        }
    }
}
