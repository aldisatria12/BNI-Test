//
//  HomeInteractor.swift
//  Case2
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? {get set}
    
    func getPromoListData()
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    
    func getPromoListData() {
        
        guard let url = URL(string: "http://demo5853970.mockable.io/promos") else { return }
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjc1OTE0MTUwLCJleHAiOjE2Nzg1MDYxNTB9.TcIgL5CDZYg9o8CUsSjUbbUdsYSaLutOWni88ZBs9S8"
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let apiList = try JSONDecoder().decode([String : [Promo]].self, from: data)
                self.presenter?.interactorWithData(result: .success(apiList["promos"]!))
            } catch {
                print("Failed, \(error)")
                return
            }
        }
        
        task.resume()
    }
}
