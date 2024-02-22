//
//  TransactionPresenter.swift
//  Case4
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol TransactionPresenterProtocol {
    var router: TransactionRouterProtocol? {get set}
    var view: TransactionViewProtocol? {get set}
    var interactor: TransactionInteractorProtocol? {get set}
    
}

class TransactionPresenter: TransactionPresenterProtocol {
    var router: TransactionRouterProtocol?
    
    var view: TransactionViewProtocol?
    
    var interactor: TransactionInteractorProtocol?
}
