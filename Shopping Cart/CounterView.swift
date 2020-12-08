import SwiftUI

struct CounterView: View {
    @Binding
    var value: Int

    var body: some View {
        HStack {
            Button(action: { self.value -= 1}) {
                Text("-")
            }
            Text("\(value)")
            Button(action: { self.value += 1 }) {
                Text("+")
            }
        }
    }
}

struct Counter_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(value: Binding.constant(3))
    }
}
