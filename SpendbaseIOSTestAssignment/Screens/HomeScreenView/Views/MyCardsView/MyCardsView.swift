//
//  MyCardsView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import SwiftUI

struct MyCardsView: View {
    
    let cards: Cards
    
    var body: some View {
        
        VStack(spacing: 0) {
            headerView
            cardsView
        }
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.white)
        )
    }
    
    private var headerView: some View {
        HStack {
            Text("My cards")
                .font(.headline)
                .padding(.horizontal, 16)
                .padding(.vertical, 9)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("See All")
                    .font(.headline)
            })
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }
        .frame(height: 40)
        .padding(.top, 2)
    }
    
    private var cardsView: some View {
        VStack(spacing: .zero) {
            ForEach(cards.suffix(3), id: \.id) { card in
                CardPreviewView(card: card)
            }
        }
        .padding(.bottom, 2)
    }
}

#Preview {
    MyCardsView(cards: .preview)
}
