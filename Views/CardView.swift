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
        Image(card.name)
            .resizable()
            .frame(width: 171, height: 260)
            .scaledToFill()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 5)
            )
    }
}

//#Preview {
//    CardView(card: card)
//}
