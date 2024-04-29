//
//  Card.swift
//  Gachor
//
//  Created by Balya Elfata on 28/04/24.
//

import Foundation

//class CardModel: Identifiable{
//    var id = UUID()
//    var name: String? = ""
//    var role: String? = ""
//    var rarity: String? = ""
//    var gender: String? = ""
//    var imageName: String? = ""
//    
//    init(id: UUID = UUID(), name: String, role: String, rarity: String, imageName: String) {
//        self.name = name
//        self.role = role
//        self.rarity = rarity
//        self.imageName = imageName
//    }
//    
//    static func getCardData() -> [CardModel] {
//        return [
//            CardModel(name: "Khoi", role: "Tech", rarity: "Rare", imageName: "khoi"),
//            CardModel(name: "Bunny", role: "Tech", rarity: "Super Rare", imageName: "bunny"),
//            CardModel(name: "GTA", role: "Tech", rarity: "Legendary", imageName: "gta"),
//            CardModel(name: "Bully", role: "Design", rarity: "Ultra Rare", imageName: "bully")
//        ]
//    }
//}

struct CardModel: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var role: String
    var rarity: String
    var imageName: String
    var pattern: String
    
    static func getCardData() -> [CardModel] {
        return [
            CardModel(name: "khoi", role: "Figure", rarity: "Legendary", imageName: "khoi", pattern: "pattern1"),
            CardModel(name: "bunny", role: "Design", rarity: "Super Rare", imageName: "bunny", pattern: "pattern1"),
            CardModel(name: "gta", role: "Tech", rarity: "Rare", imageName: "gta", pattern: "pattern1"),
            CardModel(name: "bully", role: "Skill", rarity: "Rare", imageName: "bully", pattern: "pattern1")
        ]
    }
}
