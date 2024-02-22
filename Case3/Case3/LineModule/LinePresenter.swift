//
//  LinePresenter.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol LinePresenterProtocol {
    var router: LineRouterProtocol? {get set}
    var view: LineViewProtocol? {get set}
    var interactor: LineInteractorProtocol? {get set}
    
    func viewDidLoad()
    func interactorWithData(result: Result<[LineChart], Error>)
    
}

class LinePresenter: LinePresenterProtocol {
    var router: LineRouterProtocol?
    
    var view: LineViewProtocol?
    
    var interactor: LineInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getTransactionData()
    }
    
    func interactorWithData(result: Result<[LineChart], Error>) {
        switch result {
        case .success(let transaction):
            view?.update(with: transaction)
        case . failure(let error):
            print(error)
            view?.update(with: "Try again later")
        }
    }
}
