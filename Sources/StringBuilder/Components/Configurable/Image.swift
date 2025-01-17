//
//  Image.swift
//

import UIKit

public struct Image: StringComponent {
    
    public enum Alignment {
        
        case ascender
        case descender
        case `default`
    }
    
    public var attributes: Attributes
    
    private let image: UIImage?
    private let alignment: Alignment
    private let attachment: NSTextAttachment
    
    public init(_ image: UIImage?, alignment: Alignment = .default) {
        self.image = image
        self.alignment = alignment
        self.attributes = [:]
        self.attachment = NSTextAttachment(image: image ?? UIImage())
    }
    
    private init(_ image: UIImage?, alignment: Alignment, attributes: Attributes = [:]) {
        self.image = image
        self.alignment = alignment
        self.attributes = attributes
        self.attachment = NSTextAttachment(image: image ?? UIImage())
    }
    
    public func build() -> NSMutableAttributedString {
        guard
            let image,
            !attributes.isEmpty
        else { return .init(attachment: attachment) }
        
        let attachment = attributes.reduce(into: NSTextAttachment()) { result, attribute in
            switch (attribute.key, attribute.value) {
            case (.font, let value):
                guard let font = value as? UIFont else { return }
                let ratio = image.size.width / image.size.height
                let size = CGSize(width: font.pointSize * ratio, height: font.pointSize)
                
                let y = switch alignment {
                case .ascender:
                    CGFloat.zero
                case .descender:
                    font.descender
                case .default:
                    (font.capHeight - size.height).rounded() / 2
                }
                
                result.bounds = .init(x: 0,
                                      y: y,
                                      width: size.width,
                                      height: size.height)
            case (.foregroundColor, let value):
                guard let color = value as? UIColor else { break }
                result.image = image.withTintColor(color, renderingMode: .alwaysOriginal)
            default: break
            }
        }
        
        return .init(attachment: attachment)
    }
    
    public func add(_ attributes: Attributes, ranges: [NSRange]) -> StringComponent {
        let newAttributes = attributes.reduce(into: self.attributes) { partialResult, attribute in
            partialResult[attribute.key] = attribute.value
        }
        return Image(image, alignment: alignment, attributes: newAttributes)
    }
}
