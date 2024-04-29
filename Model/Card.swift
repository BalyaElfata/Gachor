//
//  Card.swift
//  Gachor
//
//  Created by Balya Elfata on 28/04/24.
//

import Foundation
import SwiftData

@Model
class CardModel: Identifiable{
    var id = UUID()
    var name: String? = ""
    var role: String? = ""
    var rarity: String? = ""
    var gender: String? = ""
    var imageName: String? = ""
    
    init(id: UUID = UUID(), name: String, role: String, rarity: String, imageName: String) {
        self.name = name
        self.role = role
        self.rarity = rarity
        self.imageName = imageName
    }
    
    static func getCardData() -> [CardModel] {
        return [
            CardModel(name: "Bunny", role: "Tech", rarity: "Rare", imageName: "bunny"),
            CardModel(name: "GTA", role: "Tech", rarity: "Legendary", imageName: "gta"),
            CardModel(name: "Bully", role: "Design", rarity: "Ultra Rare", imageName: "bully"),
        ]
    }
}
