import SwiftUI

struct CartMainView: View {
    var inventory: Inventory = Inventory.exampleInventory

    @State
    var cart: Cart = Cart.exampleCart

    var body: some View {
        HStack(alignment: .top) {
            InventoryView(cart: $cart, inventory: inventory)
            CartView(inventory: inventory, cart: $cart)
        }
    }
}

struct CartMainView_Previews: PreviewProvider {
    static var previews: some View {
        CartMainView()
    }
}
