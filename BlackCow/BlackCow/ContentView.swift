//
//  ContentView.swift
//  BlackCow
//
//  Created by Dustin yang on 12/27/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @AppStorage("log_status") var log_Status = false
    var body: some View {

        ZStack{
            if log_Status{
                Home()
            }
            else{
                BoardingView()
            }
        }
    }
}
