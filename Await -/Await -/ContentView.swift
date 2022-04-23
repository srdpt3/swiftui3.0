//
//  ContentView.swift
//  Await -
//
//  Created by Dustin yang on 4/23/22.
//

import SwiftUI
import SDWebImageSwiftUI
struct ContentView: View {
    @StateObject var imageFetcher : ImageFetcher = .init()
    var body: some View {
        NavigationView{
            ScrollView{
                if let images = imageFetcher.fetchedImages{
                    
                    CompositionalView(items: images, id: \.id, spacing: 5){item in
                        GeometryReader{proxy in
                            let size = proxy.size
                            WebImage(url: URL(string: item.download_url))
                                .resizable().aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .cornerRadius(10)
                                .onAppear{
                                    if images.last?.id == item.id{
                                        imageFetcher.startingPagination = true
                                    }
                                }
                            
                        }

                    }.padding()
                        .padding(.bottom, 10)
                    
                    if imageFetcher.startingPagination && !imageFetcher.endPagination {
                        ProgressView().onAppear{
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                                imageFetcher.updateImage()
                            }
                        }
                    }
                }else{
                    ProgressView()
                }

            }.navigationTitle("DsYang 04/23/22")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
