//
//  Space.swift
//

import Foundation

public struct Space: StringComponent {
    
    public var attributes: Attributes
    
    public init() {
        self.attributes = [:]
    }
    
    public func build() -> NSMutableAttributedString {
        .init(string: " ")
    }
    
    public func add(_ attributes: Attributes, ranges: [NSRange]) -> StringComponent {
        self
    }
}
