//
//  AppScreen.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import Foundation
import SwiftUI

enum AppScreen: Codable, Hashable, Identifiable, CaseIterable {
    case home
    case transactios
    case myCards
    case account
    
    var id: AppScreen { self }
}

extension AppScreen {
    @ViewBuilder
    var label: some View {
        switch self {
        case .home: Label("Home", image: .tabBarItemHome)
        case .transactios: Label("Transactios", image: .tabBarItemTransactions)
        case .myCards:  Label("My Cards", image: .tabBarItemMyCards)
        case .account: Label("Account", image: .tabBarItemAccount)
        }
    }
    
    @ViewBuilder
    func destination(with mockTeamModel: MockTeamModel) -> some View {
        switch self {
        case .home: HomeScreenView(with: mockTeamModel)
        case .transactios: TransactiosScreenView()
        case .myCards: MyCardsScreenView()
        case .account:  AccountScreenView()
        }
    }
}
