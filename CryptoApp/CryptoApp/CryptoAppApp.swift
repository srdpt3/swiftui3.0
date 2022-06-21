//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Dustin yang on 6/20/22.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView().navigationBarHidden(true)
            }
        }
    }
}
