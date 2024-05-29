//
//  StringComponent.swift
//

import UIKit

public typealias Attributes = [NSAttributedString.Key: Any]

// MARK: - StringComponent
public protocol StringComponent {
    
    var attributes: Attributes { get }
    
    /// Вернуть атрибутированную строку
    /// - Returns: `NSAttributedString`
    func build() -> NSAttributedString
    
    /// Добавить атрибуты для компонента
    /// - Parameter attributes: Добавляемые атрибуты
    /// - Returns: `StringComponent`
    func add(_ attributes: Attributes) -> Self
}

// MARK: - StringComponent + Attributes
public extension StringComponent {
    
    func font(_ font: UIFont) -> Self {
        add([.font: font])
    }
    
    func color(_ color: UIColor) -> Self {
        add([.foregroundColor: color])
    }
    
    func backgroundColor(_ color: UIColor) -> Self {
        add([.backgroundColor: color])
    }
    
    func underline(_ style: NSUnderlineStyle, color: UIColor? = nil) -> Self {
        if let color = color {
            add([.underlineStyle: style.rawValue,
                 .underlineColor: color])
        } else {
            add([.underlineStyle: style.rawValue])
        }
    }
    
    func paragraphStyle(_ paragraphStyle: NSParagraphStyle) -> Self {
        add([.paragraphStyle: paragraphStyle])
    }
    
    func alignment(_ alignment: NSTextAlignment) -> Self {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        return self.paragraphStyle(paragraphStyle)
    }
    
    func lineSpacing(_ spacing: CGFloat) -> Self {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        return self.paragraphStyle(paragraphStyle)
    }
}
