import SwiftUI

struct RemovableCounterView: View {
    @Binding
    var removable: Removable

    @Binding
    var value: Int

    var body: some View {
        HStack {
            RemoveButton(removeable: $removable)
            CounterView(value: $value)
        }
    }
}

struct RemovableConterElement_Previews: PreviewProvider {
    static var previews: some View {
        RemovableCounterView(
            removable: Binding.constant(Removable()),
            value: Binding.constant(3)
        )
    }
}
