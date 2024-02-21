//
//  HistoryInteractor.swift
//  Case1
//
//  Created by Aldi Mahotma on 21/02/24.
//

import Foundation

protocol HistoryInteractorProtocol {
    var presenter: HistoryPresenterProtocol? {get set}
    
    func getTransactionData()
}

class HistoryInteractor: HistoryInteractorProtocol {
    var presenter: HistoryPresenterProtocol?
    
    func getTransactionData() {
        
    }
}
