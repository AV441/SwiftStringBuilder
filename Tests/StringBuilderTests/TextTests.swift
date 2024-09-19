import UIKit
import Testing
@testable import StringBuilder

// MARK: - TextTests
@Suite struct TextTests {
    
    var string: String = "Test"
    var attributedString: NSAttributedString = .init(string: "Test")
    
    @Test("Test Text component init with string")
    func textFromString() async throws {
        let sampleString = NSAttributedString(string: string)
        let testString = NSAttributedString {
            Text(string)
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test Text component init with closure", arguments: [true, false])
    func textFromClosure(_ argument: Bool) async throws {
        let sampleString = NSAttributedString(string: argument ? string : string.uppercased())
        let testString = NSAttributedString {
            Text {
                argument ? string : string.uppercased()
            }
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test Text component init with attributed string")
    func textFromAttributedString() async throws {
        let sampleString = NSAttributedString(attributedString: attributedString)
        let testString = NSAttributedString {
            Text(attributedString)
        }
        #expect(testString == sampleString)
    }
    
    @Test func font() async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.font: UIFont.systemFont(ofSize: 12)])
        let testString = NSAttributedString {
            Text(string)
                .font(.systemFont(ofSize: 12))
        }
        #expect(testString == sampleString)
    }
    
    @Test func color() async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.foregroundColor: UIColor.white])
        let testString = NSAttributedString {
            Text(string)
                .color(.white)
        }
        #expect(testString == sampleString)
    }
    
    @Test func backgroundColor() async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.backgroundColor: UIColor.white])
        let testString = NSAttributedString {
            Text(string)
                .backgroundColor(.white)
        }
        #expect(testString == sampleString)
    }
    
    @Test func baselineOffset() async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.baselineOffset: 2])
        let testString = NSAttributedString {
            Text(string)
                .baselineOffset(2)
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test underline attribute", arguments: [
        NSUnderlineStyle.single,
        NSUnderlineStyle.byWord,
        NSUnderlineStyle.double,
        NSUnderlineStyle.patternDash,
        NSUnderlineStyle.patternDashDot,
        NSUnderlineStyle.patternDashDotDot,
        NSUnderlineStyle.patternDot,
        NSUnderlineStyle.thick
    ])
    func underline(style: NSUnderlineStyle) async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.underlineStyle: style.rawValue])
        let testString = NSAttributedString {
            Text(string)
                .underline(style)
        }
        #expect(testString == sampleString)
    }
    
    @Test func underlineWithColor() async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue,
                                                           .underlineColor: UIColor.white])
        let testString = NSAttributedString {
            Text(string)
                .underline(.single, color: .white)
        }
        #expect(testString == sampleString)
    }
    
    @Test func strikethrough() async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        let testString = NSAttributedString {
            Text(string)
                .strikethrough(.single)
        }
        #expect(testString == sampleString)
    }
    
    @Test func strikethroughWithColor() async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                                           .strikethroughColor: UIColor.white])
        let testString = NSAttributedString {
            Text(string)
                .strikethrough(.single, color: .white)
        }
        #expect(testString == sampleString)
    }
    
    @Test func stroke() async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.strokeWidth: 2])
        let testString = NSAttributedString {
            Text(string)
                .stroke(2)
        }
        #expect(testString == sampleString)
    }
    
    @Test func strokeWithColor() async throws {
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.strokeWidth: 2,
                                                           .strokeColor: UIColor.white])
        let testString = NSAttributedString {
            Text(string)
                .stroke(2, color: .white)
        }
        #expect(testString == sampleString)
    }
    
    @Test func link() async throws {
        let path: String = "https://github.com"
        let url: URL = URL(string: path)!
        let sampleString = NSAttributedString(string: string,
                                              attributes: [.link: url.absoluteString])
        let testStringWithURL = NSAttributedString {
            Text(string)
                .link(url)
        }
        let testStringWithPath = NSAttributedString {
            Text(string)
                .link(path)
        }
        #expect(testStringWithURL == sampleString)
        #expect(testStringWithPath == sampleString)
    }
    
    @Test("Test ranged attributes")
    func ranges() async throws {
        let sampleString = NSMutableAttributedString(string: "Test string ranges")
        sampleString.addAttributes([.foregroundColor: UIColor.white, .backgroundColor: UIColor.black], range: .init(location: 0, length: 4))
        sampleString.addAttributes([.foregroundColor: UIColor.black, .backgroundColor: UIColor.white], range: .init(location: 5, length: 6))
        sampleString.addAttributes([.foregroundColor: UIColor.white, .backgroundColor: UIColor.black], range: .init(location: 12, length: 6))
        
        let testString = NSAttributedString {
            Text("Test string ranges")
                .color(.white, ranges: [.init(location: 0, length: 4), .init(location: 12, length: 6)])
                .backgroundColor(.black, ranges: [.init(location: 0, length: 4), .init(location: 12, length: 6)])
                .color(.black, ranges: [.init(location: 5, length: 6)])
                .backgroundColor(.white, ranges: [.init(location: 5, length: 6)])
        }
        #expect(testString == sampleString)
    }
}
