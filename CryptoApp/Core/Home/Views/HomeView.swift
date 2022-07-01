//
//  HomeView.swift
//  CryptoApp
//
//  Created by Dustin yang on 6/20/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm : HomeViewModel
    
    @State private var showPortfolio : Bool = false
    var body: some View {
        ZStack{
            Color.theme.background.ignoresSafeArea()
            
            VStack{
                homeHeader
                
                columnTitles
                
                
                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                
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
        .environmentObject(dev.homeVM)
        
    }
}


extension HomeView {
    private var homeHeader : some View {
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info").animation(.none)
                .background(
                    CirculeButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "My Portfolio" :
                    "Live Prices").font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right").rotationEffect(Angle(degrees: showPortfolio ?  180 : 0))
                .onTapGesture {
                    withAnimation {
                        showPortfolio.toggle()
                    }                    }
            
        }.padding(.horizontal)
    }
    
    
    private var allCoinsList : some View {
        List{
            
            
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingColumn: false)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
            
            
        }.listStyle(PlainListStyle())
        
    }
    
    private var portfolioCoinsList : some View {
        List{
            
            
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
            
            
        }.listStyle(PlainListStyle())
        
    }
    
    private var columnTitles : some View {
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
                
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3)
            
        }.font(.caption)
            .foregroundColor(Color.theme.secondaryText)
            .padding(.horizontal)
    }
}
