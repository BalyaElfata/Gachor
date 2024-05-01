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
    @State var showView = [Bool](repeating: false, count: 25)
    @State var isCardTapped = false
    let cardData = CardModel.getCardData()
    
//    let data = (1...25).map { "Item \($0)" }
//    var cards: CardModel
    
    let columns = [
        GridItem(.flexible(minimum: 150, maximum: 180)),
        GridItem(.flexible(minimum: 150, maximum: 180))
    ]
    
    var body: some View {
        VStack {
            Rectangle().frame(height: 1).foregroundColor(Color.clear)
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView(.vertical){
                    CardView(card: cardData[0]) // Steve Jobs
                        .padding(.bottom)
                        .onTapGesture {
                            Sounds.playSound(sound: "powerup3", type: "wav")
                            showView[0].toggle()}
                        .sensoryFeedback(.success, trigger: isCardTapped)
                        .sheet(isPresented: $showView[0], content: {
                            CardDetailView(card: cardData[0])})
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(cardData.indices, id: \.self) { index in
                            let card = cardData[index]
                            
                            if card.rarity == "Super Rare" {
                                CardView(card: card) // George
                                    .onTapGesture {
                                        Sounds.playSound(sound: "powerup1", type: "wav")
                                        showView[index].toggle()}
                                    .sensoryFeedback(.success, trigger: isCardTapped)
                                    .sheet(isPresented: $showView[index], content: {
                                        CardDetailView(card: card)})}
                            
                            if card.rarity == "Rare"  {
                                CardView(card: card)
                                    .onTapGesture {
                                        Sounds.playSound(sound: "powerup2", type: "wav")
                                        showView[index].toggle()}
                                    .sensoryFeedback(.success, trigger: isCardTapped)
                                    .sheet(isPresented: $showView[index], content: {
                                        CardDetailView(card: card)})}
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
}

#Preview {
    CardCollectionView()
}
