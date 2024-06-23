import UIKit
import Testing
@testable import StringBuilder

// MARK: - LinkTests
@Suite struct LinkTests {
    
    var alias: String = "link"
    var url: URL = URL(string: "https://github.com")!
    
    @Test func link() async throws {
        let sampleString = NSAttributedString(string: url.absoluteString,
                                              attributes: [.link: url.absoluteString])
        let testString = NSAttributedString {
            Link(url: url)
        }
        #expect(testString == sampleString)
    }
    
    @Test func linkWithAlias() async throws {
        let sampleString = NSAttributedString(string: alias,
                                              attributes: [.link: url.absoluteString])
        let testString = NSAttributedString {
            Link(url: url, alias: alias)
        }
        #expect(testString == sampleString)
    }
    
    @Test func linkWithAttributes() async throws {
        let sampleString = NSAttributedString(string: url.absoluteString,
                                              attributes: [.link: url.absoluteString,
                                                           .font: UIFont.systemFont(ofSize: 12)])
        let testString = NSAttributedString {
            Link(url: url)
                .font(.systemFont(ofSize: 12))
        }
        #expect(testString == sampleString)
    }
}
