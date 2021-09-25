//
//  Home.swift
//  3D Carousel Slider
//
//  Created by Dustin yang on 6/24/21.
//

import SwiftUI

struct Home: View {
    
    @State var currentTab = "p1"
    
    var body: some View {
        ZStack{
            
            GeometryReader{ proxy in
                
                
                let size = proxy.size
                
                Image(currentTab).resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: size.width, height: size.height).cornerRadius(1)
                
            }.ignoresSafeArea()

            .overlay(.ultraThinMaterial)
            .colorScheme(.dar)
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
