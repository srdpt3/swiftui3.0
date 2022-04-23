//
//  ImageFetcher.swift
//  Await -
//
//  Created by Dustin yang on 4/23/22.
//

import SwiftUI

class ImageFetcher: ObservableObject {
    @Published var fetchedImages : [ImageModel]?
    @Published var currentPage : Int = 0

    @Published var startingPagination : Bool = false;
    @Published var endPagination : Bool = false;

    init(){updateImage()}
    
    
    func updateImage(){
        currentPage += 1
        Task{
            do{
               try await fetchedImages()
            }catch {
                
            }
        }
    }

    func fetchedImages() async throws {
        guard let url = URL(string: "https://picsum.photos/v2/list?page=\(currentPage)&limit=30") else {return}
        let response = try await URLSession.shared.data(from: url)
        let images = try JSONDecoder().decode([ImageModel].self, from: response.0).compactMap({ item -> ImageModel? in
            let ImageId = item.id
            let sizedURL = "https://picsum.photos/id/\(ImageId)/500/500"
            return .init(id: ImageId, download_url: sizedURL)
        })
        await MainActor.run(body: {
            if fetchedImages == nil {
                fetchedImages = []
            }
            fetchedImages?.append(contentsOf: images)
            endPagination = (fetchedImages?.count ?? 0) > 100
            startingPagination = false
        })
        
        
    }
}

