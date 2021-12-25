//
//  SnowApp.swift
//  Snow
//
//  Created by Dustin yang on 12/25/21.
//

import SwiftUI

@main
struct SnowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
