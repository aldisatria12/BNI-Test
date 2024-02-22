//
//  HomeInteractor.swift
//  Case4
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

protocol HomeInteractorProtocol {
    var presenter: HomePresenterProtocol? {get set}
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
}
