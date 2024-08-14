import UIKit
import Testing
@testable import StringBuilder

// MARK: - TextBlockTests
@Suite struct TextBlockTests {
    
    var stringOne: String = "Test1"
    var stringTwo: String = "Test2"
    
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
        sampleString.append(.init(string: stringOne, attributes: [.foregroundColor: UIColor.black]))
        sampleString.append(.init(string: stringTwo, attributes: [.foregroundColor: UIColor.white]))
        
        sampleString.addAttribute(.font,
                                  value: UIFont.systemFont(ofSize: 12),
                                  range: .init(location: 0, length: sampleString.length))
        
        let testString = NSAttributedString {
            TextBlock {
                Text(stringOne)
                    .color(.black)
                Text(stringTwo)
            }
            .font(.systemFont(ofSize: 12))
            .color(.white)
        }
        #expect(testString == sampleString)
    }
}
