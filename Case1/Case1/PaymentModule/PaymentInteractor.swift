//
//  PaymentInteractor.swift
//  Case1
//
//  Created by Aldi Mahotma on 21/02/24.
//

import Foundation

protocol PaymentInteractorProtocol {
    var presenter: PaymentPresenterProtocol? {get set}
}

class PaymentInteractor: PaymentInteractorProtocol {
    var presenter: PaymentPresenterProtocol?
}
