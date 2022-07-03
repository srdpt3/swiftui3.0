//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Dustin yang on 7/3/22.
//

import Foundation
import Combine

class NetworkManager {
    
    enum NetworkingError : LocalizedError{
        case baseURLResponse(url: URL)
        case unknown
        
        var errorDescription: String?{
            switch self {
            case .baseURLResponse(url : let url):
                return "[😡] Bad response from URL: \(url)"
            case .unknown:
                return "[⚠]Unknown Error Occured"
            }
        }
    }
    
    static func download(url : URL) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
    static func handleURLResponse(output:URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{

        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.baseURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion : Subscribers.Completion<Error>){
        
        switch completion {
        case.finished:
            break
        case.failure(let err):
            print(err.localizedDescription)
        }
    }
}
