//
//  TransactionRouter.swift
//  Case4
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol TransactionRouterProtocol {
    var entry: TransactionViewController? {get}
    static func startExecution() -> TransactionRouterProtocol
}

class TransactionRouter: TransactionRouterProtocol {
    var entry: TransactionViewController?
    
    static func startExecution() -> TransactionRouterProtocol {
        let router = TransactionRouter()
        let view = TransactionViewController()
        let presenter = TransactionPresenter()
        let interactor = TransactionInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
}
