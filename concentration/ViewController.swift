//
//  ViewController.swift
//  concentration
//
//  Created by Joseph Sungpil Choi on 10/07/2018.
//  Copyright © 2018 Joseph Sungpil Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojis = ["😀", "🤣", "☺️", "😇", "😍", "😎", "🤩", "😫", "😢", "😀", "🤣", "☺️", "😇", "😍", "😎", "🤩", "😫", "😢"]

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojis[cardNumber], on: sender)
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard withEmoji: \(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.6993971377, blue: 0.2356643885, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }

}

