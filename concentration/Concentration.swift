//
//  Concentration.swift
//  concentration
//
//  Created by Joseph Sungpil Choi on 10/07/2018.
//  Copyright © 2018 Joseph Sungpil Choi. All rights reserved.
//

import Foundation

// classes get a free initializer so long as all their
// variables are initialized
class Concentration {
    var cards = [Card]();
    
    func chooseCard(at index: Int) {
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            // when you assign a struct to another variable
            // Swift will copy that struct
            // appending to a struct onto an array will also
            // copy that struct
            cards += [card, card]
        }
        // shuffle the cards
        var last = cards.count - 1
        while (last > 0) {
            let rand = Int(arc4random_uniform(UInt32(last)))
            cards.swapAt(last, rand)
            last -= 1
        }
    }
}