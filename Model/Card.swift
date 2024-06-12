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
            CardModel(name: "steve jobs", role: "Figure", rarity: "Legendary", imageName: "steve jobs", pattern: "pattern22"),
            CardModel(name: "pak george", role: "Figure", rarity: "Super Rare", imageName: "pak george", pattern: "pattern2"),
            CardModel(name: "pak har", role: "Tech", rarity: "Rare", imageName: "pak har", pattern: "pattern3"),
            CardModel(name: "kak athoya", role: "Tech", rarity: "Rare", imageName: "kak athoya", pattern: "pattern4"),
            CardModel(name: "kak david", role: "Tech", rarity: "Rare", imageName: "kak david", pattern: "pattern5"),
            CardModel(name: "kak octa", role: "Tech", rarity: "Rare", imageName: "kak octa", pattern: "pattern6"),
            CardModel(name: "kak viona", role: "Tech", rarity: "Rare", imageName: "kak viona", pattern: "pattern7"),
            CardModel(name: "kak khoi", role: "Tech", rarity: "Rare", imageName: "kak khoi", pattern: "pattern8"),
            CardModel(name: "ko handy", role: "Tech", rarity: "Rare", imageName: "ko handy", pattern: "pattern9"),
            CardModel(name: "kak john", role: "Desain", rarity: "Rare", imageName: "kak john", pattern: "pattern10"),
            CardModel(name: "kak ica", role: "Desain", rarity: "Rare", imageName: "kak ica", pattern: "pattern11"),
            CardModel(name: "kak nanda", role: "Desain", rarity: "Rare", imageName: "kak nanda", pattern: "pattern12"),
            CardModel(name: "kak meicy", role: "Desain", rarity: "Rare", imageName: "kak meicy", pattern: "pattern13"),
            CardModel(name: "kak kiki", role: "Desain", rarity: "Rare", imageName: "kak kiki", pattern: "pattern14"),
            CardModel(name: "kak ria", role: "Desain", rarity: "Rare", imageName: "kak ria", pattern: "pattern15"),
            CardModel(name: "ko phil", role: "Desain", rarity: "Rare", imageName: "ko phil", pattern: "pattern16"),
            CardModel(name: "pak henri", role: "Skill", rarity: "Rare", imageName: "pak henri", pattern: "pattern17"),
            CardModel(name: "pak aris", role: "Skill", rarity: "Rare", imageName: "pak aris", pattern: "pattern18"),
            CardModel(name: "kak tyo", role: "Ops", rarity: "Rare", imageName: "kak tyo", pattern: "pattern19"),
            CardModel(name: "kak made", role: "Ops", rarity: "Rare", imageName: "kak made", pattern: "pattern20"),
            CardModel(name: "kak septian", role: "Ops", rarity: "Rare", imageName: "kak septian", pattern: "pattern21"),
            CardModel(name: "kak fanny", role: "Ops", rarity: "Rare", imageName: "kak fanny", pattern: "pattern1"),
            CardModel(name: "kak yenny", role: "Ops", rarity: "Rare", imageName: "kak yenny", pattern: "pattern23"),
        ]
    }
}
