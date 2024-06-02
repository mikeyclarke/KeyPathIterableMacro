# KeyPathIterableMacro

A Swift Macro that adds a static constant containing an array of keyPaths.

## Installation

KeyPathIterableMacro is installable using Swift Package Manager.

Add to your `package.swift`

```
.package(url: "https://github.com/mikeyclarke/KeyPathIterableMacro.git", from: "1.0.0"),
```

Or through the Xcode UI:

- “Add Package Dependency…” (currently available from the File menu or in the right-click menu in the File Navigator)
- Enter the URL of this repository: `https://github.com/mikeyclarke/KeyPathIterableMacro.git`
- Choose "Up To Next Major Version": 1.0.0

## Usage

```swift
import KeyPathIterable

@KeyPathIterable
struct Season {
    var name: String
    var numberInCalendar: Int
    var startDate: Date
    var endDate: Date
}

// Expands to:

struct Season {
    var name: String
    var numberInCalendar: Int
    var startDate: Date
    var endDate: Date

    static let allKeyPaths: [PartialKeyPath<Self>] = [
        \Self.name,
        \Self.numberInCalendar,
        \Self.startDate,
        \Self.endDate
    ]
}
```

## License

KeyPathIterableMacro is available under the MIT license. See [LICENSE](LICENSE) for details.
