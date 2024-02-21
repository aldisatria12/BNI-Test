//
//  DetailRouter.swift
//  Case2
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol DetailRouterProtocol {
    var entry: DetailViewController? {get}
    static func createDetail(with apiDetail: Promo) -> DetailRouterProtocol
}

class DetailRouter: DetailRouterProtocol {
    var entry: DetailViewController?
    
    static func createDetail(with apiDetail: Promo) -> DetailRouterProtocol {
        let router = DetailRouter()
        let view = DetailViewController()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.apiDetail = apiDetail
        
        router.entry = view
        
        return router
    }
}
