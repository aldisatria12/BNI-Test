//
//  TransactionView.swift
//  Case4
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation
import UIKit

protocol TransactionViewProtocol {
    var presenter: TransactionPresenterProtocol? {get set}
}

class TransactionViewController: UIViewController, TransactionViewProtocol {

    private let messageLabel: UILabel = UILabel()
    
    var presenter: TransactionPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()    }
}

extension TransactionViewController {
    func style() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.isHidden = false
        messageLabel.text = "Success"
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.textColor = .black
        messageLabel.textAlignment = .center
    }
    
    func layout() {
        view.addSubview(messageLabel)
        
        // messageLabel
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}

