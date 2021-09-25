//
//  ContentView.swift
//  instrumentAPPUI
//
//  Created by Dustin yang on 9/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        BaseView()
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
