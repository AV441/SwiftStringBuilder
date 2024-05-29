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
    
    private init(_ string: String, attributes: () -> Attributes) {
        self.string = string
        self.attributes = attributes()
    }
    
    public func build() -> NSAttributedString {
        .init(string: string, attributes: attributes)
    }
    
    public func add(_ attributes: Attributes) -> Text {
        Text(string) {
            attributes.reduce(into: self.attributes) { partialResult, attribute in
                partialResult[attribute.key] = attribute.value
            }
        }
    }
}
