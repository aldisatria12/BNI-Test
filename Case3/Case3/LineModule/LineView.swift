//
//  LineView.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

import Foundation
import UIKit
import Charts

protocol LineViewProtocol {
    var presenter: LinePresenterProtocol? {get set}
    
    func update(with transaction:[LineChart])
    func update(with error:String)
}

class LineViewController: UIViewController, LineViewProtocol, UITableViewDelegate, UITableViewDataSource, ChartViewDelegate {
    
    private let barChartView: BarChartView = BarChartView()
    private let tableView: UITableView = UITableView()
    
    var presenter: LinePresenterProtocol?
    var transaction: [LineChart] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView.delegate = self
        style()
        layout()
        presenter?.viewDidLoad()
    }
    
    func update(with transaction: [LineChart]) {
        DispatchQueue.main.async { [weak self] in
            self?.transaction = transaction
            self?.tableView.reloadData()
            print(transaction)
            
            
            var entries = [BarChartDataEntry]()
            
            for x in 0 ... transaction[0].month.count - 1 {
                entries.append(BarChartDataEntry(x: Double(x), y: Double(transaction[0].month[x])))
            }
            
            let set = BarChartDataSet(entries: entries)
            set.colors = ChartColorTemplates.pastel()
            
            let data = BarChartData(dataSet: set)
            
            
            self?.barChartView.data = data
                    
            self?.tableView.isHidden = false
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.transaction = []
            self?.tableView.isHidden = true
        }
    }
}

extension LineViewController {
    func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func layout() {
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 128 + self.view.frame.size.width, width: self.view.frame.size.width, height: self.view.frame.size.width)
        
//        barchart
        view.addSubview(barChartView)
        barChartView.frame = CGRect(x: 0, y: 128, width: self.view.frame.size.width, height: self.view.frame.size.width)
    }
}

extension LineViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        var content = cell.defaultContentConfiguration()
//        content.text = transaction[indexPath.row].label
//        content.secondaryText = transaction[indexPath.row].percentage
        cell.contentConfiguration = content
        return cell
    }
}
