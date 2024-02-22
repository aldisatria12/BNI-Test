//
//  HomeView.swift
//  Case4
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation
import UIKit

protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? {get set}
}

class HomeViewController: UIViewController, HomeViewProtocol {

    private let messageLabel: UILabel = UILabel()
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()    }
}

extension HomeViewController {
    func style() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.isHidden = false
        messageLabel.text = "Home Page"
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

