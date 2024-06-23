//
//  StringComponent.swift
//

import UIKit

public typealias Attributes = [NSAttributedString.Key: Any]

// MARK: - StringComponent
public protocol StringComponent {
    
    /// Словарь атрибутов компонента
    var attributes: Attributes { get }
    
    /// Вернуть атрибутированную строку
    /// - Returns: `NSAttributedString`
    func build() -> NSAttributedString
    
    /// Добавить атрибуты для компонента
    /// - Parameter attributes: Добавляемые атрибуты
    /// - Returns: `StringComponent`
    func add(_ attributes: Attributes) -> StringComponent
}

// MARK: - StringComponent + Attributes
public extension StringComponent {
    
    func font(_ font: UIFont) -> StringComponent {
        add([.font: font])
    }
    
    func color(_ color: UIColor) -> StringComponent {
        add([.foregroundColor: color])
    }
    
    func backgroundColor(_ color: UIColor) -> StringComponent {
        add([.backgroundColor: color])
    }
    
    func underline(_ style: NSUnderlineStyle, color: UIColor? = nil) -> StringComponent {
        if let color = color {
            add([.underlineStyle: style.rawValue,
                 .underlineColor: color])
        } else {
            add([.underlineStyle: style.rawValue])
        }
    }
    
    func strikethrough(_ style: NSUnderlineStyle, color: UIColor? = nil) -> StringComponent {
        if let color = color {
            add([.strikethroughStyle: style.rawValue,
                 .strikethroughColor: color])
        } else {
            add([.strikethroughStyle: style.rawValue])
        }
    }
    
    func stroke(_ width: NSNumber, color: UIColor? = nil) -> StringComponent {
        if let color = color {
            add([.strokeWidth: width,
                 .strokeColor: color])
        } else {
            add([.strokeWidth: width])
        }
    }
    
    func baselineOffset(_ offset: NSNumber) -> StringComponent {
        add([.baselineOffset: offset])
    }
    
    func link(_ url: URL) -> StringComponent {
        add([.link: url.absoluteString])
    }
    
    func link(_ path: String) -> StringComponent {
        add([.link: path])
    }
}

extension StringComponent {
    
    func getParagraphStyle() -> NSMutableParagraphStyle {
        if let mutableParagraphStyle = attributes[.paragraphStyle] as? NSMutableParagraphStyle {
            mutableParagraphStyle
        } else {
            NSMutableParagraphStyle()
        }
    }
    
    func setParagraphStyle(_ paragraphStyle: NSParagraphStyle) -> StringComponent {
        add([.paragraphStyle: paragraphStyle])
    }
}

// MARK: - StringComponent + ParagraphStyle
public extension StringComponent {
    
    func alignment(_ alignment: NSTextAlignment) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.alignment = alignment
        return setParagraphStyle(paragraphStyle)
    }
    
    func lineSpacing(_ spacing: CGFloat) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        return setParagraphStyle(paragraphStyle)
    }
    
    func firstLineHeadIndent(_ indent: CGFloat) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.firstLineHeadIndent = indent
        return setParagraphStyle(paragraphStyle)
    }
    
    func headIndent(_ indent: CGFloat) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.headIndent = indent
        return setParagraphStyle(paragraphStyle)
    }
    
    func tailIndent(_ indent: CGFloat) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.tailIndent = indent
        return setParagraphStyle(paragraphStyle)
    }
    
    func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.lineBreakMode = lineBreakMode
        return setParagraphStyle(paragraphStyle)
    }
    
    func lineHeight(minimum: CGFloat = 0,
                    maximum: CGFloat = 0,
                    multiple: CGFloat = 0) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.minimumLineHeight = minimum
        paragraphStyle.maximumLineHeight = maximum
        paragraphStyle.lineHeightMultiple = multiple
        return setParagraphStyle(paragraphStyle)
    }
    
    func paragraphSpacing(_ spacing: CGFloat, before: CGFloat = 0) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.paragraphSpacing = spacing
        paragraphStyle.paragraphSpacingBefore = before
        return setParagraphStyle(paragraphStyle)
    }
    
    func baseWritingDirection(_ baseWritingDirection: NSWritingDirection) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.baseWritingDirection = baseWritingDirection
        return setParagraphStyle(paragraphStyle)
    }
    
    func hyphenationFactor(_ hyphenationFactor: Float) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.hyphenationFactor = hyphenationFactor
        return setParagraphStyle(paragraphStyle)
    }
    
    func allowsDefaultTighteningForTruncation(_ shouldAllow: Bool) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.allowsDefaultTighteningForTruncation = shouldAllow
        return setParagraphStyle(paragraphStyle)
    }
    
    func tabsStops(_ tabStops: [NSTextTab], defaultInterval: CGFloat = 0) -> StringComponent {
        let paragraphStyle = getParagraphStyle()
        paragraphStyle.tabStops = tabStops
        paragraphStyle.defaultTabInterval = defaultInterval
        return setParagraphStyle(paragraphStyle)
    }
}
