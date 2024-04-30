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
        VStack {
            Image(card.name)
                .resizable()
                .frame(width: 171, height: 247)
                .scaledToFill()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 5)
                )
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
                    case "Legendary":
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    default:
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
    }
}

//#Preview {
//    CardView(card)
//}
