//
//  StringBuilder.swift
//

import Foundation

// MARK: - StringBuilder
@resultBuilder public struct StringBuilder {
    
    public static func buildBlock(_ components: [StringComponent]...) -> [StringComponent] {
        components.flatMap { $0 }
    }
    
    public static func buildExpression(_ expression: StringComponent) -> [StringComponent] {
        [expression]
    }
    
    public static func buildExpression(_ expression: [StringComponent]) -> [StringComponent] {
        expression
    }
    
    public static func buildEither(first component: [StringComponent]) -> [StringComponent] {
        component
    }
    
    public static func buildEither(second component: [StringComponent]) -> [StringComponent] {
        component
    }
    
    public static func buildOptional(_ component: [StringComponent]?) -> [StringComponent] {
        component ?? []
    }
    
    public static func buildArray(_ components: [[StringComponent]]) -> [StringComponent] {
        components.flatMap { $0 }
    }
}

// MARK: - NSAttributedString + StringBuilder
public extension NSAttributedString {
    
    convenience init(@StringBuilder builder: () -> [StringComponent]) {
        self.init(attributedString: builder().reduce(into: NSMutableAttributedString(string: "")) {
            $0.append($1.build())
        })
    }
}
