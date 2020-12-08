import SwiftUI

struct CartItemView: View {
    var inventory: Inventory
    @Binding
    var removable: Removable
    @Binding
    var cartItem: CartItem

    var body: some View {
        HStack {
            RemovableCounterView(removable: $removable, value: $cartItem.count)
            Text(inventory.item(byId: cartItem.id)?.name ?? "Unknown")
        }
    }
}

struct CartItemElement_Previews: PreviewProvider {
    static var previews: some View {
        CartItemView(inventory: Inventory.exampleInventory, removable: Binding.constant(Removable()), cartItem: Binding.constant(CartItem(id: 1, count: 3)))
    }
}
