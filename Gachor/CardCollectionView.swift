//
//  CardCollectionView.swift
//  Gachor
//
//  Created by Balya Elfata on 28/04/24.
//

import SwiftUI
import AVFoundation

//struct CardView: View {
//    var body: some View {
//        Text("Halo")
//    }
//}

struct CardCollectionView: View {
    //    let data = (1...25).map { "Item \($0)" }
    
    //    var cards: CardModel
    
//    let cardData = CardModel.getCardData()
    
    let columns = [
        GridItem(.flexible(minimum: 150, maximum: 180)),
        GridItem(.flexible(minimum: 150, maximum: 180))
    ]
    
    var body: some View {
        ScrollView(.vertical){
            LazyVGrid(columns: columns, spacing: 16) {
                Image("bully")
                    .resizable()
                    .frame(width: 171, height: 260)
                    .scaledToFill()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 5)
                    )
                Image("bunny")
                    .resizable()
                    .frame(width: 180, height: 260)
                    .scaledToFill()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 5)
                    )
                Image("gta")
                    .resizable()
                    .frame(width: 180, height: 260)
                    .scaledToFill()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 5)
                    )
            }
        }
    }
}

#Preview {
    CardCollectionView()
}
