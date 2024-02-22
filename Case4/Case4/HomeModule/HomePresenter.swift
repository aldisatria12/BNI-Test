//
//  HomePresenter.swift
//  Case4
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var interactor: HomeInteractorProtocol? {get set}
    
}

class HomePresenter: HomePresenterProtocol {
    var router: HomeRouterProtocol?
    
    var view: HomeViewProtocol?
    
    var interactor: HomeInteractorProtocol?
}
