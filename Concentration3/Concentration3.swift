//
//  Concentration3.swift
//  Concentration3
//
//  Created by IvanChiang on 2018/5/8.
//  Copyright © 2018 IvanChiang. All rights reserved.
//

import Foundation

struct Concentration3 {
    var cards = [Card]()
    
    mutating func chooseCard(at index: Int) {
        if cards[index].isFaceUp {
            cards[index].isFaceUp = false
        }else{
            cards[index].isFaceUp = true
        }
    }
    
    //MARK: Init, Loading card and id setting
    init(numberOfPairOfCards: Int) {
        let card = Card()
        for _ in 0..<numberOfPairOfCards {
            cards = cards + [card, card]
        }
    }
}
