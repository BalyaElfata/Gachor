//
//  CardCollectionView.swift
//  Gachor
//
//  Created by Balya Elfata on 28/04/24.
//

import SwiftUI
import AVFoundation

struct CardView: View {
    var body: some View {
        Text("Halo")
    }
}

struct CardCollectionView: View {
    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView(.vertical){
            LazyVStack {
                Image("bully")
                    .resizable()
                    .frame(width: 186, height: 246)
                    .scaledToFill()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 5)
                    )
                Image("bunny")
                    .resizable()
                    .frame(width: 186, height: 246)
                    .scaledToFill()
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 5)
                    )
                Image("gta")
                    .resizable()
                    .frame(width: 186, height: 246)
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
