//
//  DetailPresenter.swift
//  Case2
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation
import UIKit

protocol DetailPresenterProtocol {
    var router: DetailRouterProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var interactor: DetailInteractorProtocol? {get set}
    
    func viewDidLoad()
    func interactorUpdateData(apiDetail: Promo?)
    func getImagePromo(imageView: UIImageView)
    
}

class DetailPresenter: DetailPresenterProtocol {
    func getImagePromo(imageView: UIImageView) {
        interactor?.getImagePromo(imageView: imageView)
    }
    
    var router: DetailRouterProtocol?
    
    var view: DetailViewProtocol?
    
    var interactor: DetailInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getPromoListData()
    }
    
    func interactorUpdateData(apiDetail: Promo?) {
            if let apiDetail = apiDetail{
                view?.update(with: apiDetail)
            } else {
                view?.update(with: "No data")
            }
    }
    
}
