//
//  BlackCowApp.swift
//  BlackCow
//
//  Created by Dustin yang on 12/27/21.
//

import SwiftUI
import Firebase

@main
struct BlackCowApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


// Intializing Firebase...

class AppDelegate: NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
