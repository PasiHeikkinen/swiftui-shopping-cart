import Foundation

struct Price: RawRepresentable, AdditiveArithmetic {
    static var zero: Price = Price(rawValue: 0.0)

    var rawValue: Double

    init(rawValue: Double) {
        self.rawValue = rawValue
    }

    static func + (lhs: Price, rhs: Price) -> Price {
        return Price(rawValue: lhs.rawValue  + rhs.rawValue)
    }

    static func - (lhs: Price, rhs: Price) -> Price {
        return Price(rawValue: lhs.rawValue - rhs.rawValue)
    }

    static func * (lhs: Price, rhs: Int) -> Price {
        return Price(rawValue: lhs.rawValue * Double(rhs))
    }

    func formattedString() -> String {
        return String(format: "%0.2f", rawValue)
    }
}
