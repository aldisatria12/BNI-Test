//
//  HistoryRouter.swift
//  Case1
//
//  Created by Aldi Mahotma on 21/02/24.
//

import Foundation

protocol HistoryRouterProtocol {
    var entry: HistoryViewController? {get}
    static func startExecution() -> HistoryRouterProtocol
    
//    func gotoDetailView(transaction: [TransactionDetail])
}

class HistoryRouter: HistoryRouterProtocol {
    var entry: HistoryViewController?
    
    static func startExecution() -> HistoryRouterProtocol {
        let router = HistoryRouter()
        let view = HistoryViewController()
        let presenter = HistoryPresenter()
        let interactor = HistoryInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
    
//    func gotoDetailView(transaction: [TransactionDetail]) {
//        let detailRouter = DetailRouter.createTransactionDetail(with: transaction)
//        guard let detailView = detailRouter.entry else { return }
//        guard let viewController = self.entry else { return }
//
//        viewController.navigationController?.pushViewController(detailView, animated: true)
//    }
}
