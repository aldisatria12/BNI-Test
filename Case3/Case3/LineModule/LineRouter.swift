//
//  LineRouter.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol LineRouterProtocol {
    var entry: LineViewController? {get}
    static func startExecution() -> LineRouterProtocol
}

class LineRouter: LineRouterProtocol {
    var entry: LineViewController?
    
    static func startExecution() -> LineRouterProtocol {
        let router = LineRouter()
        let view = LineViewController()
        let presenter = LinePresenter()
        let interactor = LineInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.entry = view
        
        return router
    }
}
