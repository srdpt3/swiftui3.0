//
//  HomeView.swift
//  CryptoApp
//
//  Created by Dustin yang on 6/20/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            // background layer
            Color.theme.background.ignoresSafeArea()
            
            VStack{
                Text("Header")
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
