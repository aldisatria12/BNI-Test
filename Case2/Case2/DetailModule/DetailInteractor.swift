//
//  DetailInteractor.swift
//  Case2
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation
import UIKit

protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    var apiDetail: Promo? {get set}
    
    func getPromoListData()
    func getImagePromo(imageView: UIImageView)
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    
    var apiDetail: Promo?
    
    func getPromoListData() {
        presenter?.interactorUpdateData(apiDetail: apiDetail)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func getImagePromo(imageView: UIImageView) {
        guard let url = URL(string: apiDetail!.images_url) else { return }
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                imageView.image = UIImage(data: data)
            }
        }
    }
}
