//
//  Card.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import Foundation

typealias Cards = [Card]

struct CardsWraper: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let id: String
    let cardLast4: String
    let cardName: String
    let isLocked, isTerminated: Bool
    let spent: Int
    let limit: Int
    let limitType: String
    let cardHolder: CardHolder
    let fundingSource: String
    let issuedAt: String
}

// MARK: - CardHolder
struct CardHolder: Codable {
    let id: String
    let fullName: String
    let email: String
    let logoURL: String

    enum CodingKeys: String, CodingKey {
        case id, fullName, email
        case logoURL = "logoUrl"
    }
}
