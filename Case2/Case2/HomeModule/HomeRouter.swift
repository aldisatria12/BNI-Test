//
//  HomeRouter.swift
//  Case2
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol HomeRouterProtocol {
    var entry: HomeViewController? {get}
    static func startExecution() -> HomeRouterProtocol

    func gotoDetailView(apiList: Promo)
}

class HomeRouter: HomeRouterProtocol {
    var entry: HomeViewController?
    
    static func startExecution() -> HomeRouterProtocol {
        let router = HomeRouter()
        let view = HomeViewController()
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
    
    func gotoDetailView(apiList: Promo) {
        let detailRouter = DetailRouter.createDetail(with: apiList)
        guard let detailView = detailRouter.entry else { return }
        guard let viewController = self.entry else { return }
        
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
}
