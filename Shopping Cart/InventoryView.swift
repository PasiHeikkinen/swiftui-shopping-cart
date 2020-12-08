import SwiftUI

struct InventoryView: View {
    @Binding
    var cart: Cart

    var inventory: Inventory

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(inventory.items, id: \.id) { item in
                InventoryItemView(cart: self.$cart, inventoryItem: item)
            }
        }
    }
}

struct InventoryView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryView(cart: Binding.constant(Cart.exampleCart), inventory: Inventory.exampleInventory)
    }
}
