//
//  CurrencyInfoManager.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import Foundation
import SwiftUI

enum Currency: String {
    case euro = "EUR"
    case dollar = "USD"
    case grivna = "UAH"
    case unowned
    //...

    var image: Image? {
        switch self {
        case .euro: Image(.flagEUR)
        case .dollar: nil
        case .grivna: nil
        case .unowned: nil
        }
    }
    
}

