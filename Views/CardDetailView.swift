//
//  CardDetailView.swift
//  Gachor
//
//  Created by Balya Elfata on 01/05/24.
//

import SwiftUI

struct CardDetailView: View {
    var card: CardModel

    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            switch card.rarity {
            case "Legendary":
                Image(card.imageName)
                    .resizable()
                    .frame(width: 360, height: 520)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.purple, lineWidth: 15)
                    )
            case "Super Rare":
                Image(card.imageName)
                    .resizable()
                    .frame(width: 360, height: 520)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.blue, lineWidth: 15)
                    )
            default:
                Image(card.imageName)
                    .resizable()
                    .frame(width: 360, height: 520)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.green, lineWidth: 15)
                    )
            }
        }
    }
}

#Preview {
    CardDetailView(card: CardModel(name: "khoi", role: "Tech", rarity: "Rare", imageName: "khoi", pattern: "pattern1"))
}
