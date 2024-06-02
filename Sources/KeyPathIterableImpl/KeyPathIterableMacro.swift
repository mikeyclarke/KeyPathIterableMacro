import SwiftSyntax
import SwiftSyntaxMacros

public struct KeyPathIterableMacro: MemberMacro {
    public static func expansion<Declaration: DeclGroupSyntax, Context: MacroExpansionContext>(
        of node: AttributeSyntax,
        providingMembersOf declaration: Declaration,
        in context: Context
    ) throws -> [DeclSyntax] {
        let keyPaths = declaration.memberBlock.members.compactMap { member -> String? in
            guard let varDecl = member.decl.as(VariableDeclSyntax.self) else {
                return nil
            }

            return varDecl.bindings.compactMap { binding -> String? in
                guard let identifier = binding.pattern.as(IdentifierPatternSyntax.self)?.identifier.text else {
                    return nil
                }

                return "\\Self.\(identifier)"
            }.joined(separator: ", ")
        }.joined(separator: ", ")

        return [
            """
            static let allKeyPaths: [PartialKeyPath<Self>] = [\(raw: keyPaths)]
            """
        ]
    }
}
