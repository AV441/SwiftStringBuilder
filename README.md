# SwiftStringBuilder
[![GitHub release](https://img.shields.io/github/release/av441/swiftstringbuilder.svg)]()
![GitHub top language](https://img.shields.io/github/languages/top/av441/swiftstringbuilder.svg)

Provides `SwiftUI` like declarative approach for NSAttributedString creation.
```swift
let attributedString = NSAttributedString {
    Text("Hello, SwiftStringBuilder!")
        .font(.systemFont(ofSize: 22, weight: .bold))
        .color(.systemIndigo)
}
```
| Features | |
| - | - |
| Branch statements support |  |
| `if` | ✅ |
| `guard` | ✅ |
| `switch` | ✅ |
| Loop statements support |  |
|`for-in`| ✅ |
| `while`| ✅ |
| `repeat-while`| ✅ |
|||
| blocks support | ⛓️‍💥 |
|||
| SPM support | 📦 |
|||
| 100% code coverage | 🛠️ |



## Installation

Swift 5.4 and Xcode 12.5 required to support `@resultBuilder` feature [Result Builder](https://github.com/apple/swift-evolution/blob/main/proposals/0289-result-builders.md).

### Swift Package Manager

In Xcode go to Project -> Your Project Name -> `Package Dependencies` -> Tap *Plus*. Insert url:

```
https://github.com/AV441/SwiftStringBuilder
```

Or add it to the `dependencies` of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/AV441/SwiftStringBuilder", .upToNextMajor(from: "1.0.1"))
]
```

and choose valid targets.

## Examples of use

### Simple example
```swift
let string = NSAttributedString {
      Image(UIImage(systemName: "star.fill"))
        .color(.systemYellow)
      
      Text("Hello,")
        .font(.systemFont(ofSize: 22))
        .color(.systemMint)
      
      Space()
      
      Text("World!")
        .font(.systemFont(ofSize: 22, weight: .bold))
        .color(.systemPurple)
      
      Text("👋")
        .font(.systemFont(ofSize: 20))
    }
```
<img src="https://github.com/AV441/SwiftStringBuilder/assets/103361928/01f55b38-4f9c-457f-90df-2b0fef44cda4" width="250" height="100">

### Complex example
```swift
let string = NSAttributedString {
        Block {
          Block {
            Text("This is a sample text")
              .color(.label)
            
            Text(" with colored undeline")
              .color(.systemTeal)
              .underline(.single, color: .systemTeal)
            
            Text(" or strikethrough")
              .color(.systemIndigo)
              .strikethrough(.single, color: .systemIndigo)
          }
          .font(.boldSystemFont(ofSize: 22))
          
          Text(" AND STROKE")
            .font(.italicSystemFont(ofSize: 24))
            .stroke(5)
            .color(.systemYellow)
          
          LineBreak(2)
          
          Text("You can check for any conditions and add ")
          
          if trueOrFalse {
            Text("green text if true.")
              .color(.systemGreen)
          } else {
            Text("red text if false.")
              .color(.systemPink)
          }
          
          LineBreak(2)
          
          Block {
            Text("Use blocks to provide common attributes for group of components, such as font, color, paragraph style etc.")
            
            LineBreak()
            
            Text("red text")
              .color(.systemRed)
            LineBreak()
            Text("green text")
              .color(.systemGreen)
            LineBreak()
            Text("blue text")
              .color(.systemBlue)
            LineBreak()
            
            Text("attributes specified for components inside block will be applied only for that components, and common attributes also will be adde to all of the components inside the block")
              .lineSpacing(5)
          }
          .font(.systemFont(ofSize: 18, weight: .medium))
          .backgroundColor(.secondarySystemFill)
          .color(.systemPurple)
          
          
          LineBreak(2)
          
          Text("Add some images using loops or conditions, like this")
            .font(.boldSystemFont(ofSize: 22))
          Space()
          
          for i in 0..<5 {
            if i < rating {
              Image(UIImage(systemName: "star.fill"))
                .color(.systemYellow)
            } else {
              Image(UIImage(systemName: "star.fill"))
                .color(.white)
            }
          }
          
          LineBreak(2)
          
          Block {
            Text("Links are also supported with ")
            Link(url: url, alias: "link alias")
              .underline(.single, color: .systemBlue)
            Text(" or without ")
            Link(url: url)
              .underline(.single, color: .systemBlue)
          }
          .font(.monospacedDigitSystemFont(ofSize: 18, weight: .light))
        }
        .firstLineHeadIndent(20)
      }
```
<img src="https://github.com/AV441/SwiftStringBuilder/assets/103361928/1980fc0c-172e-4cdf-8103-449c7df040c3)" width="250" height="450">
