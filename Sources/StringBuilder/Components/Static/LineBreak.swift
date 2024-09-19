//
//  LineBreak.swift
//

import Foundation

public struct LineBreak: StringComponent {
    
    public var attributes: Attributes
    
    private var numberOfLines: Int
    
    public init(_ numberOfLines: Int = 1) {
        self.attributes = [:]
        self.numberOfLines = numberOfLines
    }
    
    public func build() -> NSMutableAttributedString {
        var lineBreaks: String = ""
        for _ in 0..<numberOfLines {
            lineBreaks.append("\n")
        }
        return .init(string: lineBreaks)
    }
    
    public func add(_ attributes: Attributes, ranges: [NSRange]) -> StringComponent {
        self
    }
}
