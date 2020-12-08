import SwiftUI

struct InventoryItemView: View {
    @Binding
    var cart: Cart

    var inventoryItem: InventoryItem

    private func cartItemBinding(byId id: Int) -> Binding<CartItem> {
        return $cart.items
            .rewrite { $0.filter { $0.count > 0 }}
            .element(matching: { $0.id == id}, defaultValue: CartItem(id: id, count: 0))
    }

    var body: some View {
        HStack {
            RemovableCounterView(
                removable: self.$cart.items.removable(where: { $0.id == self.inventoryItem.id }),
                value: cartItemBinding(byId: inventoryItem.id).count
            )
            Text(inventoryItem.name)
            Text(inventoryItem.price.formattedString())
        }
    }
}

struct InventoryItemElement_Previews: PreviewProvider {
    static var previews: some View {
        InventoryItemView(
            cart: Binding.constant(Cart.exampleCart),
            inventoryItem: InventoryItem.exampleInventory[0]
        )
    }
}
