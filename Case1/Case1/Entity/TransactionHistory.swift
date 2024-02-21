//
//  TransactionHistory.swift
//  Case1
//
//  Created by Aldi Mahotma on 21/02/24.
//

import Foundation

struct TransactionHistory : Hashable {
    let bank: String
    let id: String
    let merchant: String
    let nominal: Int
}

extension TransactionHistory {
    static var transaction: [TransactionHistory] = [TransactionHistory(bank: "BNI", id: "ID12345677", merchant: "MERCHANT MOCK TEST", nominal: 25000)]
}
