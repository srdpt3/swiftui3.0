//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Dustin yang on 6/25/22.
//

import Foundation
import Combine
class HomeViewModel : ObservableObject {
    
    @Published var allCoins : [CoinModel] = []
    @Published var portfolioCoins : [CoinModel] = []
    private var dataService = CoinDataService()
    private var cancallable = Set<AnyCancellable>()
    
    init(){
        addSubscriber()
    }
    
    func addSubscriber(){
        dataService.$allCoins.sink { [weak self](returnedCoins) in
            self?.allCoins = returnedCoins
        }.store(in: &cancallable)
        //        DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
        //            self.allCoins.append(DeveloperPreview.instance.coin)
        //            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        //        }
    }
    //    func downloadData(
    
}
