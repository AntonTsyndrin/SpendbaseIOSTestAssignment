//
//  CardNetworkInterface.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import Foundation

protocol CardNetworkInterface {
        
    var teamId: String { get }
    
    func getTotalBalance() async throws -> Balance
    func getCards() async throws -> Cards
    func getCardsTransactions() async throws -> Transactions
}
