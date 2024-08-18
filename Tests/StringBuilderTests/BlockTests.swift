import UIKit
import Testing
@testable import StringBuilder

// MARK: - TextBlockTests
@Suite struct TextBlockTests {
    
    var stringOne: String = "Test1"
    var stringTwo: String = "Test2"
    
    @Test func blockAdd() async throws {
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne))
        sampleString.append(.init(string: stringTwo))
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                Text(stringTwo)
            }.add([:])
        }
        #expect(testString == sampleString)
    }
    
    
    @Test func block() async throws {
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne))
        sampleString.append(.init(string: stringTwo))
        sampleString.addAttribute(.font,
                                  value: UIFont.systemFont(ofSize: 12),
                                  range: .init(location: 0, length: sampleString.length))
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                Text(stringTwo)
            }
            .font(.systemFont(ofSize: 12))
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test add attributes to block")
    func attributes() {
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne, attributes: [.foregroundColor: UIColor.black,
                                                                  .backgroundColor: UIColor.red]))
        sampleString.append(.init(string: stringTwo, attributes: [.foregroundColor: UIColor.white,
                                                                  .backgroundColor: UIColor.green]))
        
        sampleString.addAttribute(.font,
                                  value: UIFont.systemFont(ofSize: 12),
                                  range: .init(location: 0, length: sampleString.length))
        
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                    .color(.black)
                    .backgroundColor(.red)
                Text(stringTwo)
            }
            .font(.systemFont(ofSize: 12))
            .color(.white)
            .backgroundColor(.green)
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test set paragraph style to block")
    func paragraphStyle() {
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne, attributes: [.font: UIFont.systemFont(ofSize: 18),
                                                                  .foregroundColor: UIColor.red]))
        sampleString.append(.init(string: stringTwo, attributes: [.font: UIFont.systemFont(ofSize: 12),
                                                                  .foregroundColor: UIColor.black]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.lineSpacing = 10
        paragraphStyle.firstLineHeadIndent = 10
        paragraphStyle.headIndent = 20
        paragraphStyle.tailIndent = 10
        paragraphStyle.lineHeightMultiple = 1.5
        paragraphStyle.minimumLineHeight = 20
        paragraphStyle.paragraphSpacing = 1
        paragraphStyle.paragraphSpacingBefore = 1
        paragraphStyle.baseWritingDirection = .rightToLeft
        paragraphStyle.hyphenationFactor = 1
        paragraphStyle.allowsDefaultTighteningForTruncation = true
        paragraphStyle.tabStops = [NSTextTab(textAlignment: .center, location: 10)]
        
        sampleString.addAttribute(.paragraphStyle,
                                  value: paragraphStyle,
                                  range: .init(location: 0, length: sampleString.length))
        
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                    .font(.systemFont(ofSize: 18))
                    .color(.red)
                Text(stringTwo)
            }
            .color(.black)
            .font(.systemFont(ofSize: 12))
            .alignment(.center)
            .lineBreakMode(.byTruncatingTail)
            .lineSpacing(10)
            .firstLineHeadIndent(10)
            .headIndent(20)
            .tailIndent(10)
            .lineHeight(minimum: 20, multiple: 1.5)
            .paragraphSpacing(1, before: 1)
            .baseWritingDirection(.rightToLeft)
            .hyphenationFactor(1)
            .allowsDefaultTighteningForTruncation(true)
            .tabsStops([NSTextTab(textAlignment: .center, location: 10)])
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test add link to block")
    func linkToBlock() {
        let urlOne = URL(string: "www.apple.com")!
        let urlTwo = URL(string: "www.github.com")!
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne, attributes: [.link: urlOne.absoluteString]))
        sampleString.append(.init(string: stringTwo, attributes: [.link: urlTwo.absoluteString]))
        
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                    .link(urlOne)
                Text(stringTwo)
            }
            .link(urlTwo)
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test add link with path to block")
    func linkWithPathToBlock() {
        let urlOne = URL(string: "www.apple.com")!
        let urlTwo = URL(string: "www.github.com")!
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne, attributes: [.link: urlOne.absoluteString]))
        sampleString.append(.init(string: stringTwo, attributes: [.link: urlTwo.absoluteString]))
        
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                    .link(urlOne)
                Text(stringTwo)
            }
            .link(urlTwo.absoluteString)
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test underline to block")
    func underlineToBlock() {
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne, attributes: [.underlineColor: UIColor.black,
                                                                  .underlineStyle: NSUnderlineStyle.single.rawValue]))
        sampleString.append(.init(string: stringTwo, attributes: [.underlineColor: UIColor.white,
                                                                  .underlineStyle: NSUnderlineStyle.single.rawValue]))
        
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                    .underline(.single, color: .black)
                Text(stringTwo)
            }
            .underline(.single, color: .white)
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test strike to block")
    func strikeToBlock() {
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne, attributes: [.strikethroughColor: UIColor.black,
                                                                  .strikethroughStyle: NSUnderlineStyle.single.rawValue]))
        sampleString.append(.init(string: stringTwo, attributes: [.strikethroughColor: UIColor.white,
                                                                  .strikethroughStyle: NSUnderlineStyle.single.rawValue]))
        
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                    .strikethrough(.single, color: .black)
                Text(stringTwo)
            }
            .strikethrough(.single, color: .white)
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test stroke to block")
    func strokeToBlock() {
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne, attributes: [.strokeColor: UIColor.black,
                                                                  .strokeWidth: 1]))
        sampleString.append(.init(string: stringTwo, attributes: [.strokeColor: UIColor.white,
                                                                  .strokeWidth: 1]))
        
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                    .stroke(1, color: .black)
                Text(stringTwo)
            }
            .stroke(1, color: .white)
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test baseline offset to block")
    func baselineOffsetToBlock() {
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: stringOne, attributes: [.baselineOffset: 2]))
        sampleString.append(.init(string: stringTwo, attributes: [.baselineOffset: 1]))
        
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                    .baselineOffset(2)
                Text(stringTwo)
            }
            .baselineOffset(1)
        }
        #expect(testString == sampleString)
    }
}
