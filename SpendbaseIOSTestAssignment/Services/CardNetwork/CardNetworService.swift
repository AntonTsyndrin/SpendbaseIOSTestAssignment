//
//  CardNetworService.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import Foundation

extension CardNetworkService {
    
    private enum Constants {
        enum FileName {
            static let totalBalance = "Cards.Account.Total-balance"
            static let cards = "Cards"
            static let transactions = "Cards.Transactions"
        }
    }
}

class CardNetworkService: CardNetworkInterface {
    
    enum CNError: Error {
        case pathNotFound
        case unknown
    }
    
    var teamId: String
    
    init(teamId: String) {
        self.teamId = teamId
    }
    
    func getTotalBalance() async throws -> Balance {
        
        sleep(UInt32(Int.random(in: 0...3)))
        
        guard let filePath = Bundle.main.path(forResource: Constants.FileName.totalBalance, ofType: "json") else { throw CNError.pathNotFound }
        return try await model(by: filePath)
    }
    
    func getCards() async throws -> Cards {
        
        sleep(UInt32(Int.random(in: 0...3)))
        
        guard let filePath = Bundle.main.path(forResource: Constants.FileName.cards, ofType: "json") else { throw CNError.pathNotFound }
        let cardsWraper: CardsWraper = try await model(by: filePath)
        return cardsWraper.cards
    }
    
    func getCardsTransactions() async throws -> Transactions {
        
        sleep(UInt32(Int.random(in: 0...3)))
        
        guard let filePath = Bundle.main.path(forResource: Constants.FileName.transactions, ofType: "json") else { throw CNError.pathNotFound }
        return try await model(by: filePath)
    }
}

extension CardNetworkService {
    
    private func model<T: Decodable>(by filePath: String) async throws -> T {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
            let results = try JSONDecoder().decode(T.self, from: data)
            return results
        }
        catch {
            throw CNError.pathNotFound
        }
    }
}
