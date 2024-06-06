//
//  HomeScreenView+ViewModel.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import Foundation

extension HomeScreenView {
    
    @Observable
    class ViewModel {
        
        let networkService: CardNetworkInterface
        
        var currency: Currency
        var balance: Balance?
        var cards: Cards?
        var transactions: Transactions?
        
        init(temaId: String, currency: Currency) {
            self.networkService = CardNetworkService(teamId: temaId)
            self.currency = currency
        }
        
        public  func fetchData() async throws {
            
            balance = try await networkService.getTotalBalance()
            cards = try await networkService.getCards()
            transactions = try await networkService.getCardsTransactions()            
        }
    }
}
