//
//  Transaction.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import Foundation
import SwiftUI

typealias Transactions = [Transaction]

struct Transaction: Codable {
    
    enum Status: String, Codable {
        case completed = "COMPLETED"
        case pending = "PENDING"
        case deeclined = "DECLINED"
    }
    
    enum TransactionType: String, Codable {
        case purchase = "PURCHASE"
        case cashWithdrawal = "CASH_WITHDRAWAL"
        case transfer = "TRANSFER"
        case billPayment = "BILL_PAYMENT"
        case topup = "TOPUP"
        
        var image: Image {
            switch self {
            case .purchase: Image(.transactionTypeBILLPAYMENT)
            case .cashWithdrawal: Image(.transactionTypeBILLPAYMENT)
            case .transfer: Image(.transactionTypeBILLPAYMENT)
            case .billPayment: Image(.transactionTypeBILLPAYMENT)
            case .topup: Image(.transactionTypeTOPUP)
            }
        }
    }
    
    let id: String
    let tribeTransactionID: String
    let tribeCardID: Int
    let amount: String
    let status: Status
    let tribeTransactionType: TransactionType
    let schemeID: String
    let merchantName: String
    let pan: String

    enum CodingKeys: String, CodingKey {
        case id
        case tribeTransactionID = "tribeTransactionId"
        case tribeCardID = "tribeCardId"
        case amount
        case status
        case tribeTransactionType
        case schemeID = "schemeId"
        case merchantName
        case pan
    }
}
