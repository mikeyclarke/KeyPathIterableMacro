import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import KeyPathIterableImpl

let testMacros: [String: Macro.Type] = [
    "KeyPathIterable": KeyPathIterableMacro.self,
]

final class KeyPathIterableTests: XCTestCase {
    func testMacro() {
        assertMacroExpansion(
            """
            @KeyPathIterable
            struct Foo {
                let bar: String
                var baz: Int
                var corge: String
            }
            """,
            expandedSource: """
            struct Foo {
                let bar: String
                var baz: Int
                var corge: String

                static let allKeyPaths: [PartialKeyPath<Self>] = [\\Self.bar, \\Self.baz, \\Self.corge]
            }
            """,
            macros: testMacros
        )
    }

    func testMacroWithNoProperties() {
        assertMacroExpansion(
            """
            @KeyPathIterable
            class Foo {
            }
            """,
            expandedSource: """
            class Foo {

                static let allKeyPaths: [PartialKeyPath<Self>] = []
            }
            """,
            macros: testMacros
        )
    }
}
