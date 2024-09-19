//
//  TextBlock.swift
//

import UIKit
import Foundation

public struct TextBlock: StringComponent {
    
    public var attributes: Attributes
    
    private let components: [StringComponent]
    
    public init(@StringBuilder _ builder: () -> [StringComponent]) {
        self.components = builder()
        self.attributes = [:]
    }
    
    private init(components: [StringComponent]) {
        self.components = components
        self.attributes = [:]
    }
    
    public func build() -> NSMutableAttributedString {
        components.reduce(into: NSMutableAttributedString()) { partialResult, component in
            partialResult.append(component.build())
        }
    }
    
    public func add(_ attributes: Attributes, ranges: [NSRange]) -> StringComponent {
        self
    }
}

// MARK: - TextBlock + Basic attributes
public extension TextBlock {
    
    func font(_ font: UIFont) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            if component.attributes.keys.contains(.font) {
                partialResult.append(component)
            } else {
                partialResult.append(component.font(font))
            }
        }
        return TextBlock(components: components)
    }
    
    func color(_ color: UIColor) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            if component.attributes.keys.contains(.foregroundColor) {
                partialResult.append(component)
            } else {
                partialResult.append(component.color(color))
            }
        }
        return TextBlock(components: components)
    }
    
    func backgroundColor(_ color: UIColor) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            if component.attributes.keys.contains(.backgroundColor) {
                partialResult.append(component)
            } else {
                partialResult.append(component.backgroundColor(color))
            }
        }
        return TextBlock(components: components)
    }
    
    func underline(_ style: NSUnderlineStyle, color: UIColor? = nil) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            if component.attributes.keys.contains(.underlineStyle) {
                partialResult.append(component)
            } else {
                partialResult.append(component.underline(style, color: color))
            }
        }
        return TextBlock(components: components)
    }
    
    func strikethrough(_ style: NSUnderlineStyle, color: UIColor? = nil) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            if component.attributes.keys.contains(.strikethroughStyle) {
                partialResult.append(component)
            } else {
                partialResult.append(component.strikethrough(style, color: color))
            }
        }
        return TextBlock(components: components)
    }
    
    func stroke(_ width: NSNumber, color: UIColor? = nil) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            if component.attributes.keys.contains(.strokeWidth) {
                partialResult.append(component)
            } else {
                partialResult.append(component.stroke(width, color: color))
            }
        }
        return TextBlock(components: components)
    }
    
    func baselineOffset(_ offset: NSNumber) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            if component.attributes.keys.contains(.baselineOffset) {
                partialResult.append(component)
            } else {
                partialResult.append(component.baselineOffset(offset))
            }
        }
        return TextBlock(components: components)
    }
    
    func link(_ url: URL) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            if component.attributes.keys.contains(.link) {
                partialResult.append(component)
            } else {
                partialResult.append(component.link(url))
            }
        }
        return TextBlock(components: components)
    }
    
    func link(_ path: String) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            if component.attributes.keys.contains(.link) {
                partialResult.append(component)
            } else {
                partialResult.append(component.link(path))
            }
        }
        return TextBlock(components: components)
    }
}

// MARK: - TextBlock + Paragraph style attributes
public extension TextBlock {
    
    func alignment(_ alignment: NSTextAlignment) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.alignment(alignment))
        }
        return TextBlock(components: components)
    }
    
    func lineSpacing(_ spacing: CGFloat) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.lineSpacing(spacing))
        }
        return TextBlock(components: components)
    }
    
    func firstLineHeadIndent(_ indent: CGFloat) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.firstLineHeadIndent(indent))
        }
        return TextBlock(components: components)
    }
    
    func headIndent(_ indent: CGFloat) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.headIndent(indent))
        }
        return TextBlock(components: components)
    }
    
    func tailIndent(_ indent: CGFloat) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.tailIndent(indent))
        }
        return TextBlock(components: components)
    }
    
    func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.lineBreakMode(lineBreakMode))
        }
        return TextBlock(components: components)
    }
    
    func lineHeight(minimum: CGFloat = 0,
                    maximum: CGFloat = 0,
                    multiple: CGFloat = 0) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.lineHeight(minimum: minimum,
                                                      maximum: maximum,
                                                      multiple: multiple))
        }
        return TextBlock(components: components)
    }
    
    func paragraphSpacing(_ spacing: CGFloat, before: CGFloat = 0) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.paragraphSpacing(spacing, before: before))
        }
        return TextBlock(components: components)
    }
    
    func baseWritingDirection(_ baseWritingDirection: NSWritingDirection) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.baseWritingDirection(baseWritingDirection))
        }
        return TextBlock(components: components)
    }
    
    func hyphenationFactor(_ hyphenationFactor: Float) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.hyphenationFactor(hyphenationFactor))
        }
        return TextBlock(components: components)
    }
    
    func allowsDefaultTighteningForTruncation(_ shouldAllow: Bool) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.allowsDefaultTighteningForTruncation(shouldAllow))
        }
        return TextBlock(components: components)
    }
    
    func tabsStops(_ tabStops: [NSTextTab], defaultInterval: CGFloat = 0) -> TextBlock {
        let components = components.reduce(into: [StringComponent]()) { partialResult, component in
            partialResult.append(component.tabsStops(tabStops, defaultInterval: defaultInterval))
        }
        return TextBlock(components: components)
    }
}
