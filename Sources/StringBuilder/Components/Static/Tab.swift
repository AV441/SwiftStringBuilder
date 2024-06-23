//
//  Tab.swift
//

import Foundation

public struct Tab: StringComponent {
    
    public var attributes: Attributes
    
    public init() {
        self.attributes = [:]
    }
    
    public func build() -> NSAttributedString {
        .init(string: "\t")
    }
    
    public func add(_ attributes: Attributes) -> StringComponent {
        self
    }
}
