//
//  AttributedBlock.swift
//

import Foundation

public struct AttributedBlock: StringComponent {
    
    public var attributes: Attributes
    
    private let components: [StringComponent]
    
    public init(@AttributedBlockBuilder _ builder: () -> [StringComponent]) {
        self.components = builder()
        self.attributes = [:]
    }
    
    private init(components: [StringComponent]) {
        self.components = components
        self.attributes = [:]
    }
    
    public func build() -> NSAttributedString {
        components.reduce(into: NSMutableAttributedString()) { partialResult, component in
            partialResult.append(component.build())
        }
    }
    
    public func add(_ attributes: Attributes) -> AttributedBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            let missingAttributes = attributes.reduce(into: attributes) { partialResult, attribute in
                if component.attributes.keys.contains(attribute.key) {
                    partialResult.removeValue(forKey: attribute.key)
                }
            }
            partialResult.append(component.add(missingAttributes))
        }
        return AttributedBlock(components: components)
    }
}
