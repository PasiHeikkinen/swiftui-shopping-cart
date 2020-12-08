import SwiftUI

extension Binding {
    func removable<T>(index: Int) -> Binding<Removable> where Value == [T] {
        return Binding<Removable>(get: {
            Removable()
        }, set: { _ in
            self.wrappedValue.remove(at: index)
        })
    }

    func removable<T>(where predicate: @escaping (T) -> Bool) -> Binding<Removable> where Value == [T] {
        return Binding<Removable>(get: {
            Removable()
        }, set: { _ in
            if let index = self.wrappedValue.firstIndex(where: predicate) {
                self.wrappedValue.remove(at: index)
            }
        })
    }

    func elementAt<T>(index: Int) -> Binding<T> where Value == [T] {
        return Binding<T>(get: {
            return self.wrappedValue[index]
        }, set: {
            self.wrappedValue[index] = $0
        })
    }

    func rewrite(_ transform: @escaping (Value) -> Value) -> Binding<Value> {
        return Binding<Value>(get: {
            return self.wrappedValue
        }, set: {
            self.self.wrappedValue = transform($0)
        })
    }


    func element<T>(matching predicate: @escaping (T) -> Bool, defaultValue: T) -> Binding<T> where Value == [T] {
        return Binding<T>(get: {
            return self.wrappedValue.first(where: predicate) ?? defaultValue
        }, set: {
            if let index = self.wrappedValue.firstIndex(where: predicate) {
                self.wrappedValue[index] = $0
            } else {
                self.wrappedValue.append($0)
            }
        })
    }
}
