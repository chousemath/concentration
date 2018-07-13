//
//  ViewController.swift
//  concentration
//
//  Created by Joseph Sungpil Choi on 10/07/2018.
//  Copyright © 2018 Joseph Sungpil Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    private(set) var matchCount = 0 {
        didSet {
            matchCountLabel.text = "Matches: \(matchCount)"
        }
    }
    
    private var emojis = ["😀", "🤣", "☺️", "😇", "😍", "😎", "🤩", "😫", "😢", "😡", "😱", "🤮"]

    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var matchCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        matchCount = game.matches
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("?", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.6993971377, blue: 0.2356643885, alpha: 1)
            }
        }
    }
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.id] == nil, emojis.count > 0 {
            let rand = arc4random_uniform(UInt32(emojis.count))
            emoji[card.id] = emojis.remove(at: Int(rand))
        }
        return emoji[card.id] ?? "?"
    }
}

