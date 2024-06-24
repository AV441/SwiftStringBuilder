# StringBuilder

Provides declarative approach for NSAttributedString creation.

# Example
```swift
let string = NSAttributedString {
    Text("Hello, World!")
        .font(.systemFont(ofSize: 12))
        .color(.label)
        .underline(.single, color: .separator)
    Space()
    Text("👋")
        .font(.systemFont(ofSize: 20))
}
```
