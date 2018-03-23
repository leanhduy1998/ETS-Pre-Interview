//: Playground - noun: a place where people can play

import UIKit



class Card{
    func getValue() ->String{
        if(value>1&&value<11){
            return "\(value)"
        }
        else{
            switch(value){
            case 1:
                return "A"
            case 11:
                return "J"
            case 12:
                return "Q"
            case 13:
                return "K"
            default:
                return ""
            }
        }
    }
    var value = -1;
}

class EmptyCard: Card{
    var suit = "undefined"
}

class Deck{
    var cards = [Card]();
    
    func shuffle(){
        if(cards.count <= 1){
            print("No card to shuffle")
        }
        
        for _ in 0...1000{
            let firstCardToSwap = Int(arc4random_uniform(UInt32(cards.count)))
            var secondCardToSwap = Int(arc4random_uniform(UInt32(cards.count)))
            
            while(firstCardToSwap == secondCardToSwap){
                secondCardToSwap = Int(arc4random_uniform(UInt32(cards.count)))
            }
            
            let tempCard = cards[firstCardToSwap]
            cards[firstCardToSwap] = cards [secondCardToSwap]
            cards[secondCardToSwap] = tempCard
        }
        print("Done shuffle")
    }
    
    func dealOneCard()->Card{
        if(cards.count == 0){
            print("No card to deal")
            let emptyCard = EmptyCard()
            return emptyCard
        }
        
        let randomIntCardLeft  = Int(arc4random_uniform(UInt32(cards.count)))
        
        let cardToDeal = cards[randomIntCardLeft]
        cards.remove(at: randomIntCardLeft)
        
        
        if let card = cardToDeal as? Heart{
            print("Deal card \(card.getValue())\(card.getSuit())")
        }
        else if let card = cardToDeal as? Diamond{
            print("Deal card \(card.getValue())\(card.getSuit())")
        }
        else if let card = cardToDeal as? Club{
            print("Deal card \(card.getValue())\(card.getSuit())")
        }
        else if let card = cardToDeal as? Spade{
            print("Deal card \(card.getValue())\(card.getSuit())")
        }
        
        return cardToDeal
    }
}

class Club: Card{
    func getSuit() ->String{
        return "♣"
    }
}
class Diamond: Card{
    func getSuit() ->String{
        return "♦"
    }
}
class Heart: Card{
    func getSuit() ->String{
        return "♥"
    }
}
class Spade: Card{
    func getSuit() ->String{
        return "♠"
    }
}

var deck = Deck()

for suit in 0...3{
    for value in 1...13{
        var card: Card!
        
        switch(suit){
        case 0:
            card = Heart()
            break
        case 1:
            card = Diamond()
            break
        case 2:
            card = Spade()
            break
        case 3:
            card = Club()
            break
        default:
            break
        }
    
        card.value = value
        deck.cards.append(card)
    }
}

for _ in 0...52{
    deck.shuffle()
    
    let deal = deck.dealOneCard()
    print()
    
    if deal is EmptyCard{
        // the card dealt was empty!
    }
}





