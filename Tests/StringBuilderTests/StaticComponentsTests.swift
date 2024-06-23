import UIKit
import Testing
@testable import StringBuilder

// MARK: - StaticComponentsTests
@Suite struct StaticComponentsTests {
    
    @Suite struct TabTests {
        @Test("Test tab creation")
        func creation() {
            let sampleString = NSAttributedString(string: "\t")
            let testString = NSAttributedString {
                Tab()
            }
            #expect(testString == sampleString)
        }
        
        @Test("Test tab add attributes")
        func addAttributes() {
            let sampleString = NSAttributedString(string: "\t")
            let testString = NSAttributedString {
                Tab()
                    .alignment(.center)
            }
            #expect(testString == sampleString)
        }
    }
    
    @Suite struct SpaceTests {
        @Test("Test space creation")
        func creation() {
            let sampleString = NSAttributedString(string: " ")
            let testString = NSAttributedString {
                Space()
            }
            #expect(testString == sampleString)
        }
        
        @Test("Test space add attributes")
        func addAttributes() {
            let sampleString = NSAttributedString(string: " ")
            let testString = NSAttributedString {
                Space()
                    .alignment(.center)
            }
            #expect(testString == sampleString)
        }
    }
    
    @Suite struct EmptyTests {
        @Test("Test empty creation")
        func creation() {
            let sampleString = NSAttributedString(string: "")
            let testString = NSAttributedString {
                Empty()
            }
            #expect(testString == sampleString)
        }
        
        @Test("Test empty add attributes")
        func addAttributes() {
            let sampleString = NSAttributedString(string: "")
            let testString = NSAttributedString {
                Empty()
                    .alignment(.center)
            }
            #expect(testString == sampleString)
        }
    }
    
    @Suite struct LineBreakTests {
        
        @Test("Test line break creation")
        func creation() {
            let sampleString = NSAttributedString(string: "\n")
            let testString = NSAttributedString {
                LineBreak()
            }
            #expect(testString == sampleString)
        }
        
        @Test("Test line break add attributes")
        func addAttributes() {
            let sampleString = NSAttributedString(string: "\n")
            let testString = NSAttributedString {
                LineBreak()
                    .alignment(.center)
            }
            #expect(testString == sampleString)
        }
    }
}
