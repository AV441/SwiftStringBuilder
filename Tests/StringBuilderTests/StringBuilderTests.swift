import UIKit
import Testing
@testable import StringBuilder

// MARK: - StringBuilderTests
@Suite struct StringBuilderTests {
    
    var condition: Bool = Bool.random()
    
    @Test("Test build block")
    func components() {
        let sampleString = NSMutableAttributedString()
        sampleString.append(.init(string: "one"))
        sampleString.append(.init(string: "two"))
        sampleString.append(.init(string: "three"))
        let testString = NSAttributedString {
            Text("one")
            Text("two")
            Text("three")
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test if else block", arguments: [
        true,
        false
    ])
    func conditions(_ condition: Bool) {
        let sampleString = NSMutableAttributedString()
        if condition {
            sampleString.append(.init(string: "one"))
        } else {
            sampleString.append(.init(string: "two"))
        }
        
        let testString = NSAttributedString {
            if condition {
                Text("one")
            } else {
                Text("two")
            }
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test loops")
    func loops() {
        let array: [NSAttributedString] = [
            .init(string: "one", attributes: [.foregroundColor: UIColor.white]),
            .init(string: "two", attributes: [.font: UIFont.systemFont(ofSize: 12)]),
            .init(string: "three", attributes: [.backgroundColor: UIColor.white])
        ]
        let sampleString = NSMutableAttributedString()
        array.forEach {
            sampleString.append($0)
        }
        let testString = NSAttributedString {
            for string in array {
                Text(string)
            }
        }
        #expect(testString == sampleString)
    }
    
    @Test("Test if block", arguments: [
        nil,
        "Test"
    ])
    func optional(_ string: String?) {
        let sampleString = NSMutableAttributedString()
        if let string {
            sampleString.append(.init(string: string))
        }
        let testString = NSAttributedString {
            if let string {
                Text(string)
            }
        }
        #expect(testString == sampleString)
    }
    
    @Test
    func buildExpression() {
        let components = [
            Text("Test"),
            Text("Test")
        ]
        let sample = NSMutableAttributedString()
        sample.append(.init(string: "Test"))
        sample.append(.init(string: "Test"))
        let test = NSAttributedString {
            components
        }
        #expect(sample == test)
    }
    
    @Test("Test buildOptional", arguments: [
        nil,
        [Text("Test")],
        [Text("Test"), Text(.init(string: "Test",
                                  attributes: [.foregroundColor: UIColor.white]))]
    ])
    func buildOptional(components: [StringComponent]?) {
        let sample = NSMutableAttributedString()
        if let components {
            components.forEach {
                sample.append(.init(attributedString: $0.build()))
            }
          
        }
        let test = NSAttributedString {
            if let components {
                components
            }
        }
        #expect(sample == test)
    }
}
