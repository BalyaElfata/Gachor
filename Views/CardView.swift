//
//  CardView.swift
//  Gachor
//
//  Created by Balya Elfata on 29/04/24.
//

import SwiftUI

struct CardView: View {
    
    var card: CardModel

    var body: some View {
        VStack(spacing: 10) {
            switch card.rarity {
            case "Legendary":
                Image(card.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 171, height: 247)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.purple, lineWidth: 5)
                    )
            case "Super Rare":
                Image(card.imageName)
                    .resizable()
                    .frame(width: 180, height: 247)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 5)
                    )
            default:
                Image(card.imageName)
                    .resizable()
                    .frame(width: 171, height: 247)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.green, lineWidth: 5)
                    )
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 121, height: 34)
                    .cornerRadius(20)
                HStack{
                    switch card.rarity {
                    case "Super Rare":
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    case "Legendary":
                        Image(systemName: "star.fill")
                            .foregroundColor(.purple)
                        Image(systemName: "star.fill")
                            .foregroundColor(.purple)
                        Image(systemName: "star.fill")
                            .foregroundColor(.purple)
                    default:
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
    }
}

#Preview {
    CardView(card: CardModel(name: "kak khoi", role: "Figure", rarity: "Legendary", imageName: "kak khoi", pattern: "pattern1"))
}
