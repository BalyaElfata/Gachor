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
            CardModel(name: "kak khoi", role: "Figure", rarity: "Legendary", imageName: "kak khoi", pattern: "pattern1"),
            CardModel(name: "ko handy", role: "Figure", rarity: "Super Rare", imageName: "ko handy", pattern: "pattern2"),
            CardModel(name: "pak har", role: "Tech", rarity: "Rare", imageName: "pak har", pattern: "pattern3"),
            CardModel(name: "kak athoya", role: "Tech", rarity: "Rare", imageName: "kak athoya", pattern: "pattern4"),
            CardModel(name: "kak david", role: "Tech", rarity: "Rare", imageName: "kak david", pattern: "pattern5"),
            CardModel(name: "kak octa", role: "Tech", rarity: "Rare", imageName: "kak octa", pattern: "pattern6"),
            CardModel(name: "kak viona", role: "Tech", rarity: "Rare", imageName: "kak viona", pattern: "pattern7"),
//            CardModel(name: "kak khoi", role: "Tech", rarity: "Rare", imageName: "kak khoi", pattern: "pattern8"),
//            CardModel(name: "ko handy", role: "Tech", rarity: "Rare", imageName: "ko handy", pattern: "pattern9"),
        ]
    }
}
