//
//  PreviewData.swift
//  TopQuestions
//
//  Created by Він on 11.05.2024.
//

import Foundation

extension [Card] {
    static var preview: [Card] {
        let url = Bundle.main.url(forResource: "Cards", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let wrapper = try! JSONDecoder().decode(CardsWraper.self, from: data)
            return wrapper.cards
        } catch {
            print("Error preview")
            return []
        }
        
    }
}

extension Card {
    static var preview: Card {
        [Card].preview[0]
    }
}

extension [Transaction] {
    static var preview: [Transaction] {
        let url = Bundle.main.url(forResource: "Cards.Transactions", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let item = try! JSONDecoder().decode([Transaction].self, from: data)
            return item
        } catch {
            print("Error preview")
            return []
        }
        
    }
}

extension Transaction {
    static var preview: Transaction {
        [Transaction].preview[1]
    }
}

extension Balance {
    static var preview: Balance {
        let url = Bundle.main.url(forResource: "Cards.Account.Total-balance", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            let item = try! JSONDecoder().decode(Balance.self, from: data)
            return item
        } catch {
            print("Error preview")
            return Balance(value: 0)
        }
        
    }
}
