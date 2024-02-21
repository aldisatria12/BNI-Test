//
//  HistoryPresenter.swift
//  Case1
//
//  Created by Aldi Mahotma on 21/02/24.
//

import Foundation

protocol HistoryPresenterProtocol {
    var router: HistoryRouterProtocol? {get set}
    var view: HistoryViewProtocol? {get set}
    var interactor: HistoryInteractorProtocol? {get set}
    
    func viewDidLoad()
    
}

class HistoryPresenter: HistoryPresenterProtocol {
    var router: HistoryRouterProtocol?
    
    var view: HistoryViewProtocol?
    
    var interactor: HistoryInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getTransactionData()
    }
}
