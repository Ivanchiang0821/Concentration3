//
//  Card.swift
//  Concentration3
//
//  Created by IvanChiang on 2018/5/8.
//  Copyright © 2018 IvanChiang. All rights reserved.
//

import Foundation

struct Card: Hashable {
    private var cardId = 0
    var isFaceUp = false
    var isMatched = false
    
    var hashValue: Int {return cardId}
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.cardId == rhs.cardId
    }
    
    private var idFactory = 0
    private mutating func getUniqueId () -> Int {
        idFactory += 1
        return idFactory
    }
    init() {
        self.cardId = getUniqueId()
    }
}
