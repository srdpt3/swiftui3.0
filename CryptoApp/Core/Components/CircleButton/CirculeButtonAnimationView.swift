//
//  CirculeButtonAnimationView.swift
//  CryptoApp
//
//  Created by Dustin yang on 6/20/22.
//

import SwiftUI

struct CirculeButtonAnimationView: View {
    @Binding var animate : Bool
    var body: some View {
        Circle().stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) :.none)
            .onAppear{
                animate.toggle()
            }
    }
}

struct CirculeButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CirculeButtonAnimationView(animate:.constant(false))
    }
}
