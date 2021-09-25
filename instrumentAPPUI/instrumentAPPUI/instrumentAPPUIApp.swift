//
//  instrumentAPPUIApp.swift
//  instrumentAPPUI
//
//  Created by Dustin yang on 9/23/21.
//

import SwiftUI

@main
struct instrumentAPPUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


extension View{
    
    func getRect()->CGRect{
        UIScreen.main.bounds
    }
    
    func getSafeArea()->UIEdgeInsets{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return .zero
        }
        
        return safeArea
    }
}

