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
        
        
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink { (completion  )in
                switch completion {
                case.finished:
                    break
                case.failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { [weak self](returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            }
       
        
    }
}
