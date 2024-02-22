//
//  LineInteractor.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol LineInteractorProtocol {
    var presenter: LinePresenterProtocol? {get set}
    
    func getTransactionData()
}

class LineInteractor: LineInteractorProtocol {
    var presenter: LinePresenterProtocol?
    
    func getTransactionData() {
        guard let month: [LineChart] = Bundle.main.decode(file: "staticMonth.json") else {
            return
        }
        
        self.presenter?.interactorWithData(result: .success(month))
    }
}
