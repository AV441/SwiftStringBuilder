import UIKit
import Testing
@testable import StringBuilder

// MARK: - ImageTests
@Suite struct ImageTests {
    
    var image: UIImage = UIImage(systemName: "star")!
    
    @Test func testInit() {
        let test = NSAttributedString {
            Image(image)
        }
        #expect(test.attributes(at: 0, effectiveRange: nil).contains(where: { $0.key == .attachment }))
    }
}
