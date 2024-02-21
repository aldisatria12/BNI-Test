//
//  HomeInteractor.swift
//  Case1
//
//  Created by Aldi Mahotma on 21/02/24.
//

import Foundation

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? {get set}
    
    func getSaldoData() -> Int
    func changeSaldo(amount: Int)
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    
    func getSaldoData() -> Int {
        guard let saldo = Saldo.saldo as? Int else { return 0 }
        return saldo
    }
    
    func changeSaldo(amount: Int) {
        Saldo.saldo = Saldo.saldo - amount
    }
}
