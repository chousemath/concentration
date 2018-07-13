//
//  Card.swift
//  concentration
//
//  Created by Joseph Sungpil Choi on 10/07/2018.
//  Copyright © 2018 Joseph Sungpil Choi. All rights reserved.
//

import Foundation

// There is no inheritance when working with Structs
// structs are value types, while classes are reference types
// structs get copied all over the place (because value type)
struct Card {
    var isFaceUp = false
    var isMatched = false
    var id: Int
    
    private static var uniqueId = 0
    
    private static func getUniqueId() -> Int {
        uniqueId += 1
        return uniqueId
    }
    
    init() {
        self.id = Card.getUniqueId()
    }
}
