//
//  HomePresenter.swift
//  Case2
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol HomePresenterProtocol {
    var router: HomeRouterProtocol? {get set}
    var view: HomeViewProtocol? {get set}
    var interactor: HomeInteractorProtocol? {get set}
    
    func viewDidLoad()
    func interactorWithData(result: Result<[Promo], Error>)
    func tapOnDetail(_ apiList: Promo)
    
}

class HomePresenter: HomePresenterProtocol {
    var router: HomeRouterProtocol?
    
    var view: HomeViewProtocol?
    
    var interactor: HomeInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getPromoListData()
    }
    
    func interactorWithData(result: Result<[Promo], Error>) {
        switch(result) {
        case .success(let apiList):
            view?.update(with: apiList)
        case .failure(let error):
            print(error)
            view?.update(with: "Try again later...")
        }
    }
    
    func tapOnDetail(_ apiList: Promo) {
        router?.gotoDetailView(apiList: apiList)
    }
}
