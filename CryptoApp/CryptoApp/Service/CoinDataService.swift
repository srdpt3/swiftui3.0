//
//  CoinDataService.swift
//  CryptoApp
//
//  Created by Dustin yang on 6/30/22.
//

import Foundation
import Combine
class CoinDataService {
    @Published var allCoins : [CoinModel] = []
    var cancellable = Set<AnyCancellable>()
    var coinSubscription : AnyCancellable?
    init() {
        getCoins()
    }
    
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&per_page=100&page=1&sparkline=true") else {return}
        
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: {[weak self](returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
        
    }
}
