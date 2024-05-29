//
//  Link.swift
//

import Foundation

public struct Link: StringComponent {
    
    public var attributes: Attributes

    private let url: URL
    private let alias: String?
    
    public init(url: URL, alias: String? = nil) {
        self.url = url
        self.alias = alias
        self.attributes = [:]
    }
    
    private init(url: URL,
                 alias: String? = nil,
                 attributes: () -> Attributes) {
        self.url = url
        self.alias = alias
        self.attributes = attributes()
    }
    
    public func build() -> NSAttributedString {
        .init(string: alias ?? url.absoluteString,
              attributes: attributes.reduce(into: attributes) { partialResult, attribute in
            partialResult[.link] = url
        })
    }
    
    public func add(_ attributes: Attributes) -> Link {
        Link(url: url, alias: alias) {
            attributes.reduce(into: self.attributes) { partialResult, attribute in
                partialResult[attribute.key] = attribute.value
            }
        }
    }
}
