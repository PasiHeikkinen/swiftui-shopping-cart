import Foundation

struct InventoryItem {
    let id: Int
    let name: String
    let price: Price
}

extension InventoryItem {
    init(id: Int, name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = Price(rawValue: price)
    }
}

extension InventoryItem {
    static let exampleInventory: [InventoryItem] = [
        .init(id: 1, name: "Toilet paper", price: 1.0),
        .init(id: 2, name: "Bread", price: 2.5),
        .init(id: 3, name: "Butter", price: 2.0),
        .init(id: 4, name: "Milk", price: 3.0),
        .init(id: 5, name: "Coffee", price: 2.5),
        .init(id: 6, name: "Cheese", price: 1.5)
    ]
}
