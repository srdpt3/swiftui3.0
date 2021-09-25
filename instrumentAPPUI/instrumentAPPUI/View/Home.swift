//
//  Home.swift
//  instrumentAPPUI
//
//  Created by Dustin yang on 9/23/21.
//

import SwiftUI

struct Home: View {
    
    @State var cars : [Car] = [

        Car(name: "IONIC", description: "현대 아이오닉 전기차", price: "$31200",image: "1"),
        Car(name: "KIA EV6", description: "기아 EV6 전기차", price: "$35000",image: "2"),
        Car(name: "LIFE", description: "폭스바겐 LIFE 전기차", price: "$25220",image: "3"),
    ]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 18){
                
                HStack{
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "sidebar.left")
                            .font(.title2)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.vertical.3")
                            .font(.title2)
                    }

                }
                .foregroundColor(.black)
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("전기차 쇼핑")
                        .font(.largeTitle.bold())
                    
                    Text("판 커지는 전기차 시장")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.vertical,20)
                
                ForEach($cars){ $car in
                    
                    CardView(car: $car)
                }
                
            }

            .padding()
            .padding(.bottom,100)
            
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View{
    
    @Binding var car: Car
    // Offset for gesture...
    @GestureState var gestureOffset: CGFloat = 0
    @State var offset: CGFloat = 0
    
    // Last stored Offset...
    @State var lastStoredOffset: CGFloat = 0
    
    var body: some View{
        
        HStack{
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(car.name)
                    .fontWeight(.bold)
                
                Text(car.description)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(car.price)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            
            Image(car.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
        }
        .padding(.horizontal)
        .padding(.vertical,6)
        .background(
        
            ZStack{
                
                Color.white
                
                Color("Card")
                    .opacity(-offset / 100)
            }
        )
        .cornerRadius(15)
        .contentShape(Rectangle())
        .offset(x: offset)
        .background(
        
            ZStack(alignment: .trailing){
                
                Color("Brown")
                
                VStack(spacing: 35){
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "pencil.circle.fill")
                            .font(.title2)
                    }
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                }
                .foregroundColor(.white)
                .padding(.trailing,35)
            }
            .cornerRadius(15)
            .padding(.horizontal,2)
        )
        .gesture(
        
            DragGesture()
                .updating($gestureOffset, body: { value, out, _ in
                    
                    out = value.translation.width
                }).onEnded({ value in
                    
                    // checking..
                    let translation = value.translation.width
                    
                    if translation < 0 && -translation > 100{
                        offset = -100
                    }
                    else{
                        offset = 0
                    }
                    
                    lastStoredOffset = offset
                })
        )
        .animation(.easeInOut, value: gestureOffset == 0)
        // updating offset...
        .onChange(of: gestureOffset) { newValue in
            offset = (gestureOffset + lastStoredOffset) > 0 ? 0 : (gestureOffset + lastStoredOffset)
        }
    }
}
