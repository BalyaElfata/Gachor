//
//  CardCollectionView.swift
//  Gachor
//
//  Created by Balya Elfata on 28/04/24.
//

import SwiftUI
import AVFoundation

struct CardCollectionView: View {
    @Environment(\.dismiss) var dismiss
    let cardData = CardModel.getCardData()
    
//    let data = (1...25).map { "Item \($0)" }
//    var cards: CardModel
    
    let columns = [
        GridItem(.flexible(minimum: 150, maximum: 180)),
        GridItem(.flexible(minimum: 150, maximum: 180))
    ]
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            ScrollView(.vertical){
                CardView(card: cardData[0]) // Steve Jobs
                    .padding(.bottom)
                LazyVGrid(columns: columns, spacing: 16) {
                    CardView(card: cardData[1]) // George
                    ForEach(cardData) { card in
                        if (card.rarity == "Rare")  {
                            CardView(card: card)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                            Image(systemName: "house.fill")
                                .foregroundColor(Color(red: 0.95, green: 0.68, blue: 0))
                            
                        }
                    }
                }
    }
}

#Preview {
    CardCollectionView()
}
