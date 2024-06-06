//
//  Balance.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import Foundation

struct Balance: Codable {
    var value: Double
    
    enum CodingKeys: String, CodingKey {
        case value = "balance"
    }
    
}
