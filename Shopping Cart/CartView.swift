import SwiftUI

struct CartView: View {
    var inventory: Inventory

    @Binding
    var cart: Cart

    var body: some View {
        return VStack(alignment: .leading) {
            ForEach(Array(cart.items.enumerated()), id: \.1.id) { (item: (Int, CartItem)) -> CartItemView in
                let (index, _) = item
                return CartItemView(
                    inventory: self.inventory,
                    removable: self.$cart.items.removable(index: index),
                    cartItem: self.$cart.items
                        .rewrite({ $0.filter { $0.count > 0 }})
                        .elementAt(index: index)
                )
            }
            Text("Total: \(inventory.totalPrice(ofCart: cart).formattedString())")
        }
    }
}


struct CartElement_Previews: PreviewProvider {
    static var previews: some View {
        CartView(inventory: Inventory.exampleInventory, cart: Binding.constant(Cart.exampleCart))
    }
}
