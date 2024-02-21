//
//  HomepageInteractor.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol HomepageInteractorProtocol {
    var presenter: HomepagePresenterProtocol? {get set}
    
    func getTransactionData()
}

class HomepageInteractor: HomepageInteractorProtocol {
    var presenter: HomepagePresenterProtocol?
    
    func getTransactionData() {
        guard let transaction: [Transaction] = Bundle.main.decode(file: "staticData.json") else {
            return
        }
        
        self.presenter?.interactorWithData(result: .success(transaction))
    }
}
