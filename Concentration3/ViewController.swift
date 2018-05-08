//
//  ViewController.swift
//  Concentration3
//
//  Created by IvanChiang on 2018/5/7.
//  Copyright © 2018 IvanChiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration3(numberOfPairOfCards: numberOfPairOfCards)
    var numberOfPairOfCards: Int {
        get { return cardButton.count / 2 }
    }
    var flipCount = 0
    @IBOutlet var cardButton: [UIButton]!
//    var cardNumber = 0
    @IBAction func touchButton(_ sender: UIButton) {
        if let cardNumber = cardButton.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    var emojiChoices = "⚽️🏀🎾🏈🎱⚾️🏓🏐🏉"
    var emojiDic = [Card:String]()
    //MARK: emoji Setting and sync with Card's id
    func emojiSetting(for card: Card) -> String {
        if emojiDic[card] == nil, emojiChoices.count > 0 {
            let addEmoji = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
                emojiDic[card] = String(emojiChoices.remove(at: addEmoji))
        }
        return emojiDic[card] ?? "?"
    }
    func updateViewFromModel() {
        flipCount += 1
        flipCountLabel.text = "Flips = \(flipCount)"
        for index in cardButton.indices {
            //MARK: sync UIButton and Card
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                button.setTitle(emojiSetting(for: card), for: UIControlState.normal)
            }else{
                button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                button.setTitle("", for: UIControlState.normal)
            }
        }
        
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
}
extension Int {
    var arc4random: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}

