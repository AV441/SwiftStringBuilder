//
//  Text.swift
//

import Foundation

public struct Text: StringComponent {
    
    public var attributes: Attributes

    private let string: String
    
    public init(_ string: String) {
        self.string = string
        self.attributes = [:]
    }
    
    public init(_ block: () -> String) {
        self.string = block()
        self.attributes = [:]
    }
    
    public init(_ attributedString: NSAttributedString) {
        self.string = attributedString.string
        self.attributes = attributedString.attributes(at: 0, effectiveRange: nil)
    }
    
    private init(_ string: String, attributes: () -> Attributes) {
        self.string = string
        self.attributes = attributes()
    }
    
    public func build() -> NSMutableAttributedString {
        .init(string: string, attributes: attributes)
    }
    
    public func add(_ attributes: Attributes) -> StringComponent {
        Text(string) {
            attributes.reduce(into: self.attributes) { partialResult, attribute in
                partialResult[attribute.key] = attribute.value
            }
        }
    }
}
