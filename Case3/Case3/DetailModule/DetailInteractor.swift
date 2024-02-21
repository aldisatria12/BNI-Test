//
//  DetailInteractor.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? {get set}
    var transaction: [TransactionDetail]? {get set}
    
    func getTransactionData()
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    
    var transaction: [TransactionDetail]?
    
    func getTransactionData() {
        presenter?.interactorUpdateData(transaction: transaction)
    }
}
