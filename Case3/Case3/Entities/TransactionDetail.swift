//
//  TransactionDetail.swift
//  Case3
//
//  Created by Aldi Mahotma on 22/02/24.
//

import Foundation

struct TransactionDetail: Codable {
    let trxDate: String
    let nominal: Int

    enum CodingKeys: String, CodingKey {
        case trxDate = "trx_date"
        case nominal
    }
}

extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("File could not be found.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Fail to load the file")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Error decoding the file")
        }
        
        return loadedData
    }
}
