//
//  Card.swift
//  Gachor
//
//  Created by Balya Elfata on 28/04/24.
//

import Foundation

struct CardModel: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var role: String
    var rarity: String
    var imageName: String
    var pattern: String
    
//    init(id: UUID = UUID(), name: String, role: String, rarity: String, imageName: String) {
//        self.name = name
//        self.role = role
//        self.rarity = rarity
//        self.imageName = imageName
//    }
    
    static func getCardData() -> [CardModel] {
        return [
            CardModel(name: "khoi", role: "Figure", rarity: "Legendary", imageName: "khoi", pattern: "pattern1"),
            CardModel(name: "handy", role: "Design", rarity: "Super Rare", imageName: "handy", pattern: "pattern2"),
            CardModel(name: "gta", role: "Tech", rarity: "Rare", imageName: "gta", pattern: "pattern3"),
            CardModel(name: "bully", role: "Skill", rarity: "Rare", imageName: "bully", pattern: "pattern4"),
            CardModel(name: "bunny", role: "Tech", rarity: "Rare", imageName: "bunny", pattern: "pattern5")
        ]
    }
}
