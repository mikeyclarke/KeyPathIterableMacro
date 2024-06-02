import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct KeyPathIterablePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        KeyPathIterableMacro.self
    ]
}
