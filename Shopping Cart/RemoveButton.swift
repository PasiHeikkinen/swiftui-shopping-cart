import SwiftUI

struct RemoveButton: View {
    @Binding
    var removeable: Removable

    var body: some View {
        Button(action: { self.removeable.remove() }) {
            Text("🗑")
        }
    }
}

struct RemoveButton_Previews: PreviewProvider {
    static var previews: some View {
        RemoveButton(removeable: Binding.constant(Removable()))
    }
}

struct Removable {
    mutating func remove() {}
}
