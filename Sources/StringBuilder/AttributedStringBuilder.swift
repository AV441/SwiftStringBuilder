//
//  AttributedStringBuilder.swift
//

import Foundation

// MARK: - AttributedStringBuilder
@resultBuilder public struct AttributedStringBuilder {
    
    public static func buildBlock(_ components: StringComponent...) -> NSAttributedString {
        components.reduce(into: NSMutableAttributedString()) { partialResult, string in
            partialResult.append(string.build())
        }
    }
}

// MARK: - AttributedBlockBuilder
@resultBuilder public struct AttributedBlockBuilder {
    
    public static func buildBlock(_ components: StringComponent...) -> [StringComponent] {
        components
    }
}

// MARK: - NSAttributedString + AttributedStringBuilder
public extension NSAttributedString {
    
    convenience init(@AttributedStringBuilder _ builder: () -> NSAttributedString) {
        self.init(attributedString: builder())
    }
}
