//
//  Text.swift
//

import Foundation

public struct Text: StringComponent {
    
    public var attributes: Attributes = [:]
    
    private var rangedAttributes: RangedAttributes = [:]

    private let string: String
    
    private var totalRange: NSRange {
        .init(location: 0, length: NSAttributedString(string: string).length)
    }
    
    public init(_ string: String) {
        self.string = string
    }
    
    public init(_ block: () -> String) {
        self.string = block()
    }
    
    public init(_ attributedString: NSAttributedString) {
        self.string = attributedString.string
        self.attributes = attributedString.attributes(at: 0, effectiveRange: nil)
    }
    
    private init(_ string: String,
                 attributes: () -> Attributes,
                 rangedAttributes: () -> RangedAttributes) {
        self.string = string
        self.attributes = attributes()
        self.rangedAttributes = rangedAttributes()
    }
    
    public func build() -> NSMutableAttributedString {
        let mutable = NSMutableAttributedString(string: string, attributes: attributes)
        rangedAttributes.forEach { range, attributes in
            if totalRange.contains(range.lowerBound) && totalRange.contains(range.upperBound - 1) {
                mutable.addAttributes(attributes, range: range)
            }
        }
        return mutable
    }
    
    public func add(_ attributes: Attributes, ranges: [NSRange]) -> StringComponent {
        Text(string) {
            if ranges.isEmpty {
                attributes.reduce(into: self.attributes) { partialResult, attribute in
                    partialResult[attribute.key] = attribute.value
                }
            } else {
                self.attributes
            }
        } rangedAttributes: {
            ranges.reduce(into: self.rangedAttributes) { partialResult, range in
                if let existingAttributesInRange = partialResult[range] {
                    partialResult[range] = attributes.merge(with: existingAttributesInRange)
                } else {
                    partialResult[range] = attributes
                }
            }
        }
    }
}

extension [NSAttributedString.Key: Any] {
    
    func merge(with otherAttributes: [NSAttributedString.Key: Any]) -> [NSAttributedString.Key: Any] {
        otherAttributes.reduce(into: self) { partialResult, attribute in
            partialResult[attribute.key] = attribute.value
        }
    }
}
