//
//  NSMutableAttributedStringTests.swift
//

import UIKit
import Testing
@testable import StringBuilder

// MARK: - NSMutableAttributedStringTests
@Suite struct NSMutableAttributedStringTests {
    
    @Test func addAttributesTest() async throws {
        let testString = NSMutableAttributedString(string: "Test")
        let sampleString = NSMutableAttributedString(string: "Test")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byTruncatingTail
        sampleString.addAttribute(.font,
                                  value: UIFont.systemFont(ofSize: 12),
                                  range: .init(location: 0, length: sampleString.length))
        sampleString.addAttribute(.paragraphStyle,
                                  value: paragraphStyle,
                                  range: .init(location: 0, length: sampleString.length))
        
        testString
            .font(.systemFont(ofSize: 12))
            .alignment(.center)
            .lineBreakMode(.byTruncatingTail)
        
        #expect(testString == sampleString)
    }
}
