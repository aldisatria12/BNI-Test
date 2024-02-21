//
//  HomePresenter.swift
//  Case1
//
//  Created by Aldi Mahotma on 21/02/24.
//

import Foundation

protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var interactor: HomeInteractorProtocol? {get set}
    
    func viewDidLoad()
    
    func toPaymentPage(transaction: TransactionHistory)
    func toHistoryPage()
    
    func getSaldo() -> Int
    func changeSaldo(amount: Int)
}

class HomePresenter: HomePresenterProtocol {
    func toPaymentPage(transaction: TransactionHistory) {
        router?.gotoPaymentView(transaction: transaction)
    }
    
    func toHistoryPage() {
        router?.gotoHistoryView()
    }
    
    var router: HomeRouterProtocol?
    
    var view: HomeViewProtocol?
    
    var interactor: HomeInteractorProtocol?
    
    func viewDidLoad() {
        
    }
    
    func getSaldo() -> Int {
        guard let saldo = interactor?.getSaldoData() else { return 0 }
        return saldo
    }
    
    func changeSaldo(amount: Int) {
        interactor?.changeSaldo(amount: amount)
    }
}
