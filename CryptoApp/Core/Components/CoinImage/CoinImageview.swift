//
//  CoinImageview.swift
//  CryptoApp
//
//  Created by Dustin yang on 7/3/22.
//

import SwiftUI
import Combine

class CoinImageviewModel : ObservableObject{
    @Published var image : UIImage? = nil
    @Published var isLoading: Bool = false
    private let coin : CoinModel
    private let dataService : CoinImageService
    private var cancellables  = Set<AnyCancellable>()
    init(coin: CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers(){
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
    
    private func getImage(){
        
    }
}


struct CoinImageview: View {
    
    @StateObject var vm : CoinImageviewModel
    
    init(coin: CoinModel){
        _vm = StateObject(wrappedValue: CoinImageviewModel(coin: coin))
    }
    
    var body: some View {
        ZStack{
            if let image = vm.image{
                Image(uiImage: image).resizable().scaledToFit()
            }else if  vm.isLoading{
                ProgressView()
            }else{
                Image(systemName: "questionmark").foregroundColor(Color.theme.secondaryText)
            }
        }
    }
}

struct CoinImageview_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageview(coin:dev.coin).padding().previewLayout(.sizeThatFits)
    }
}
