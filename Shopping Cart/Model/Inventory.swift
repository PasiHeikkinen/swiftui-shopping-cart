import Foundation

struct Inventory {
    var items: [InventoryItem]

    func item(byId id: Int) -> InventoryItem? {
        return items.first { $0.id == id }
    }

    func totalPrice(ofCart cart: Cart) -> Price {
        return cart.items.reduce(.zero) { (result, item) -> Price in
            guard let inventoryItem = items.first(where: { $0.id == item.id }) else {
                return result
            }
            return inventoryItem.price * item.count
        }
    }
}

extension Inventory {
    static let exampleInventory = Inventory(items: [
            .init(id: 1, name: "Toilet paper", price: 1.0),
            .init(id: 2, name: "Bread", price: 2.5),
            .init(id: 3, name: "Butter", price: 2.0),
            .init(id: 4, name: "Milk", price: 3.0),
            .init(id: 5, name: "Coffee", price: 2.5),
            .init(id: 6, name: "Cheese", price: 1.5)
        ])
}
