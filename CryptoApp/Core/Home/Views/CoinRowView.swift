//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Dustin yang on 6/22/22.
//

import SwiftUI

struct CoinRowView: View {
    let coin : CoinModel
    let showHoldingColumn : Bool
    var body: some View {
        HStack(spacing: 0){
            leftColumn
            Spacer()
            if showHoldingColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingColumn: true)
            .previewLayout(.sizeThatFits)
    }
}


extension CoinRowView {
    private var leftColumn : some View{
        HStack(spacing : 0){
            Text("\(coin.rank)").font(.caption).foregroundColor(Color.theme.secondaryText).frame(minWidth : 30)
            
            
            CoinImageview(coin: coin).frame(width: 30, height: 30)
            Text(coin.symbol.uppercased()).font(.headline).padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var centerColumn : some View{
        VStack{
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals()).bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }.foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn : some View{
        
        VStack(alignment : .trailing){
            Text((coin.currentPrice.asCurrencyWith6Decimals()))
                .bold().foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green :Color.theme.red)
            
        }
        .frame(width: UIScreen.main.bounds.width / 3)
    }
}
