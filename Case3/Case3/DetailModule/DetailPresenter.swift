//
//  DetailPresenter.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol DetailPresenterProtocol {
    var router: DetailRouterProtocol? {get set}
    var interactor: DetailInteractorProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    
    func interactorUpdateData(transaction: [TransactionDetail]?)
    func viewDidLoad()
    
}

class DetailPresenter: DetailPresenterProtocol {
    var router: DetailRouterProtocol?
    
    var interactor: DetailInteractorProtocol?
    
    var view: DetailViewProtocol?
    
    func interactorUpdateData(transaction: [TransactionDetail]?) {
        if let transaction = transaction {
            view?.update(with: transaction)
        } else {
            view?.update(with: "No data")
        }
    }
    
    func viewDidLoad() {
        interactor?.getTransactionData()
    }
}
