//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Dustin yang on 5/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Home().navigationBarHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
