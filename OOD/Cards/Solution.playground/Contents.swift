/*
 Deck of Cards
    Design the data structures for a generic deck of cards. Explain how you would subclass the data structures to implement blackjack
*/

class Card {
    var type: CardType
    var value: CardValue
    init(_ type: CardType, _ value: CardValue) {
        self.type = type
        self.value = value
    }
    
    enum CardType {
        case hearts
        case clubs
        case diamonds
        case spades
    }
    enum CardValue {
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case ten
        case jack
        case queen
        case king
        case ace
    }
}

class Deck<T: Card> {
    private var cards: Array<T>
    
    init() {
        cards = Deck.generateDeck()
    }
    
    private static func generateDeck() -> Array<T> {
        return []
    }
    
    func dealCard() -> T? {
        return cards.last
    }
    
    func dealHand(_ count: Int) -> Array<T?> {
        var result: Array<T?> = []
        for _ in 0..<count {
            result.append(dealCard())
        }
        return result
    }
}

class Hand<T: Card> {
    var cards: Array<T> = []
    
    func add(_ card: Card) {
        
    }
}
