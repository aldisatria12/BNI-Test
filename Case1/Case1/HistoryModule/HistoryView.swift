//
//  HistoryView.swift
//  Case1
//
//  Created by Aldi Mahotma on 21/02/24.
//

import Foundation
import UIKit

protocol HistoryViewProtocol {
    var presenter: HistoryPresenterProtocol? {get set}
}

class HistoryViewController: UIViewController, HistoryViewProtocol, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var presenter: HistoryPresenterProtocol?
    var transaction: [TransactionHistory] = []
    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        transaction = TransactionHistory.transaction
        tableView.reloadData()
        presenter?.viewDidLoad()
    }
}

extension HistoryViewController {
    func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func layout() {
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width)
    }
}

extension HistoryViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
        content.text = "Rp. \(transaction[indexPath.row].nominal)"
        content.secondaryText = transaction[indexPath.row].merchant
        cell.contentConfiguration = content
        return cell
    }
}
