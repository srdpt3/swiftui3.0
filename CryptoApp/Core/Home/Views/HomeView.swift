//
//  HomeView.swift
//  CryptoApp
//
//  Created by Dustin yang on 6/20/22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var shorPortfolio : Bool = false
    
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            
            VStack{
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView().navigationBarHidden(true)
        }
        
    }
}


extension HomeView {
    private var homeHeader : some View {
        HStack{
            CircleButtonView(iconName: shorPortfolio ? "plus" : "info").animation(.none)
                .background(
                    CirculeButtonAnimationView(animate: $shorPortfolio)
                )
            Spacer()
            Text(shorPortfolio ? "My Portfolio" :
                    "Live Prices").font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right").rotationEffect(Angle(degrees: shorPortfolio ?  180 : 0))
                .onTapGesture {
                    withAnimation {
                        shorPortfolio.toggle()
                    }                    }
            
        }.padding(.horizontal)
    }
}
