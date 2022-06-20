//
//  ContentView.swift
//  Task Manager_CoreData
//
//  Created by Dustin yang on 5/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home().navigationTitle("Task Manager - Dustin")
                .navigationBarTitleDisplayMode(.inline)
            
        }
     
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
