//
//  FeedView.swift
//  HER
//
//  Created by Dustin yang on 6/26/21.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewPostView = false
    @EnvironmentObject var viewModel : AuthViewModel

    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack{
                        ForEach(0..<20){ _ in
                            DashboardCell()
                        }
                    }.padding()
                    
                }
                Button(action: {
                    viewModel.signOut()
//                        isShowingNewPostView.toggle()
                     
                }, label: {
                    Image(systemName: "plus").resizable()
                        .renderingMode(.template)
                        .frame(width: 32, height: 32).padding()
                })
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $isShowingNewPostView){
                    NewPostView(isPresented: $isShowingNewPostView)
                }
                
                
                
            }.navigationBarTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
        }

       
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
