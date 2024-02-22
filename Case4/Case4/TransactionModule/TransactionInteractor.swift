//
//  TransactionInteractor.swift
//  Case4
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol TransactionInteractorProtocol {
    var presenter: TransactionPresenterProtocol? {get set}
}

class TransactionInteractor: TransactionInteractorProtocol {
    var presenter: TransactionPresenterProtocol?
}
