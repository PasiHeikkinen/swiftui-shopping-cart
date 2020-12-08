import Foundation

struct Cart {
    var items: [CartItem]

    func itemIndex(byId id: Int) -> Int? {
        return items.firstIndex(where: { $0.id == id })
    }
}

extension Cart {
    static let exampleCart = Cart(items: [
        .init(id: 4, count: 1),
        .init(id: 1, count: 2)
    ])
}
