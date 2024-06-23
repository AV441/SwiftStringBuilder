import UIKit
import Testing
@testable import StringBuilder

// MARK: - ParagraphStyleTests
@Suite struct ParagraphStyleTests {
    
    var string: String = "Test"
    
    @Test func getParagraphStyle() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byWordWrapping
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .alignment(.center)
                .lineBreakMode(.byWordWrapping)
        }
        #expect(testString == sampleString)
    }
    
    @Test func alignment() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .alignment(.center)
        }
        #expect(testString == sampleString)
    }
    
    @Test func lineSpacing() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .lineSpacing(2)
        }
        #expect(testString == sampleString)
    }
    
    @Test func firstLineHeadIndent() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 2
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .firstLineHeadIndent(2)
        }
        #expect(testString == sampleString)
    }
    
    @Test func headIndent() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = 2
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .headIndent(2)
        }
        #expect(testString == sampleString)
    }
    
    @Test func tailIndent() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.tailIndent = 2
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .tailIndent(2)
        }
        #expect(testString == sampleString)
    }
    
    @Test func lineBreakMode() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byClipping
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .lineBreakMode(.byClipping)
        }
        #expect(testString == sampleString)
    }
    
    @Test func minimumLineHeight() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = 20
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .lineHeight(minimum: 20)
        }
        #expect(testString == sampleString)
    }
    
    @Test func maximumLineHeight() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.maximumLineHeight = 20
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .lineHeight(maximum: 20)
        }
        #expect(testString == sampleString)
    }
    
    @Test func lineHeightMultiple() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 20
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .lineHeight(multiple: 20)
        }
        #expect(testString == sampleString)
    }
    
    @Test func paragraphSpacing() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 20
        paragraphStyle.paragraphSpacingBefore = 20
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .paragraphSpacing(20, before: 20)
        }
        #expect(testString == sampleString)
    }
    
    @Test func baseWritingDirection() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.baseWritingDirection = .leftToRight
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .baseWritingDirection(.leftToRight)
        }
        #expect(testString == sampleString)
    }
    
    @Test func hyphenationFactor() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.hyphenationFactor = 0.5
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .hyphenationFactor(0.5)
        }
        #expect(testString == sampleString)
    }
    
    @Test(arguments: [true, false])
    func allowsDefaultTighteningForTruncation(_ shouldAllow: Bool) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.allowsDefaultTighteningForTruncation = shouldAllow
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .allowsDefaultTighteningForTruncation(shouldAllow)
        }
        #expect(testString == sampleString)
    }
    
    @Test func tabStops() {
        let tabStops = [NSTextTab(textAlignment: .left, location: 0)]
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.tabStops = tabStops
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.paragraphStyle: paragraphStyle])
        let testString = NSAttributedString {
            Text(string)
                .tabsStops(tabStops)
        }
        #expect(testString == sampleString)
    }
}
