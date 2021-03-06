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
    private(set) var cards = [Card]()
    private(set) var matches = 0
    
    func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)), index out of bounds")
        if !cards[index].isMatched {
            cards[index].isFaceUp = !cards[index].isFaceUp
            if cards[index].isFaceUp {
                var upIndices = [Int]()
                for idx in cards.indices {
                    if cards[idx].isFaceUp, idx != index {
                        upIndices.append(idx)
                        if cards[idx].id == cards[index].id {
                            cards[idx].isFaceUp = false
                            cards[idx].isMatched = true
                            cards[index].isFaceUp = false
                            cards[index].isMatched = true
                            matches += 1
                            return
                        }
                    }
                }
                if upIndices.count == 2 {
                    for ind in upIndices {
                        cards[ind].isFaceUp = false
                    }
                }
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(numberOfPairsOfCards: \(numberOfPairsOfCards)), must initialize a game with at least 1 pair of cards")
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
            let rand = last.random
            cards.swapAt(last, rand)
            last -= 1
        }
    }
}

extension Int {
    var random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
