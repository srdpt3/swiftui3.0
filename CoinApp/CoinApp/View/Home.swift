//
//  Home.swift
//  CoinApp
//
//  Created by Dustin yang on 9/29/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        VStack{
          
            HStack{
                Button {
                    
                } label: {
                    Image(systemName: "slider.vertical.3")
                        .font(.title2)
                }
                Text("제발 가즈아  9/29/21 By Dustin")
                    .fontWeight(.bold)
                Spacer()
                
                Button {
                    
                } label: {
                    Image("main")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }

            }
            .padding()
            .foregroundColor(.black)
            
            VStack(spacing: 10){
                
                Text("Total Balance")
                    .fontWeight(.bold)
                
                Text("$12,000,000")
                    .font(.system(size: 38, weight: .bold))
            }
            .padding(.top,20)
            
            Button {
                
            } label: {
                
                HStack(spacing: 5){
                    
                    Text("My Income")
                    
                    Image(systemName: "chevron.down")
                }
                .font(.caption.bold())
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(.white,in: Capsule())
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)
            }
            
            // Graph View....
            LineGraph(data: samplePlot)
            // Max Size..
                .frame(height: 200)
                .padding(.top,25)
            
            Text("Assets")
                .font(.title.bold())
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
//                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 20){
                    
                    CardView(image: "btc", title: "Bitcoin", price: "$110,000", color: Color("Gradient1"))
                    
                    CardView(image: "eth", title: "Ethereum", price: "$6800", color: Color("Gradient2"))
                    
                    CardView(image: "ada", title: "Ada", price: "$5.7", color: Color.green)
                }
                .padding()
            }

        }
    }
    
    // Card View..
    @ViewBuilder
    func CardView(image: String,title: String,price: String,color: Color)->some View{
        
        VStack(spacing: 15){
            
            Image(image)
                .resizable()
//                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
//                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .padding()
//                .background(color,in: Circle())
            
            Text(title)
                .font(.title3.bold())
            
            Text(price)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
//        .padding(.vertical)
        .padding(.horizontal,15)
        .background(.white,in: RoundedRectangle(cornerRadius: 15))
        // shadows...
        .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Sample Plot For Graph.....
let samplePlot: [CGFloat] = [

    98900,120000,75000,79000,65000,95000,120000,60000,50000,60000,89000,120300,140000,90000,125000,
160000,120000
]
