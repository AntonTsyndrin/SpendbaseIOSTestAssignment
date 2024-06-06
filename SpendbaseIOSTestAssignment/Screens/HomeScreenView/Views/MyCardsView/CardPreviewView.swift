//
//  CardPreviewView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import SwiftUI

struct CardPreviewView: View {
    
    let card: Card
    
    var body: some View {
        
        HStack {
            cardView
            cardNameView
            Spacer()
        }
        .frame(height: 56)
    }
    
    private var cardView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(.charade)
                .frame(width: 48, height: 32)
            Text(card.cardLast4)
                .font(.system(size: 10).bold())
                .foregroundStyle(.white)
                .frame(width: 36, height: 20, alignment: .bottomTrailing)
        }
        .padding(.leading, 16)
    }
    
    private var cardNameView: some View {
        Text(card.cardName)
            .font(.callout)
            .fontWeight(.semibold)
    }
}

#Preview {
    CardPreviewView(card: .preview)
}
