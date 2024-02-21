//
//  Transaction.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

struct Transaction: Codable {
    let label: String
    let percentage: String
    let data: [TransactionDetail]
}
