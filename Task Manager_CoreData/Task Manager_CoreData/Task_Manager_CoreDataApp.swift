//
//  Task_Manager_CoreDataApp.swift
//  Task Manager_CoreData
//
//  Created by Dustin yang on 5/28/22.
//

import SwiftUI

@main
struct Task_Manager_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
