//
//  LineBreak.swift
//

import Foundation

public struct LineBreak: StringComponent {
    
    public var attributes: Attributes
    
    public init() {
        self.attributes = [:]
    }
    
    public func build() -> NSAttributedString {
        .init(string: "\n")
    }
    
    public func add(_ attributes: Attributes) -> LineBreak {
        self
    }
}
