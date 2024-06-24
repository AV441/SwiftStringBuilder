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
    
    @Test(arguments: [
        Image.Alignment.default,
        Image.Alignment.ascender,
        Image.Alignment.descender
    ])
    func alignment(alignment: Image.Alignment) {
        let font = UIFont.systemFont(ofSize: 12)
        let ratio = image.size.width / image.size.height
        let size = CGSize(width: font.pointSize * ratio, height: font.pointSize)
        let y: CGFloat = switch alignment {
        case .ascender:
                .zero
        case .descender:
            font.descender
        case .default:
            (font.capHeight - size.height).rounded() / 2
        }
        let sampleBounds = CGRect(x: 0,
                                  y: y,
                                  width: size.width,
                                  height: size.height)
        
        let test = NSAttributedString {
            Image(image, alignment: alignment)
                .font(.systemFont(ofSize: 12))
        }
        var testBounds: CGRect = .zero
        test.enumerateAttributes(in: .init(location: 0, length: test.length)) { attributes, _, _ in
            if let attachment = attributes[.attachment] as? NSTextAttachment {
                testBounds = attachment.bounds
            }
        }
        #expect(testBounds == sampleBounds)
    }
    
    @Test(arguments: [
        UIColor.red,
        UIColor.green,
        UIColor.blue
    ])
    func tintColor(color: UIColor) {
        let sampleImage = image.withTintColor(color, renderingMode: .automatic)
        
        let test = NSAttributedString {
            Image(image)
                .color(color)
        }
        var testImage: UIImage?
        test.enumerateAttributes(in: .init(location: 0, length: test.length)) { attributes, _, _ in
            if let attachment = attributes[.attachment] as? NSTextAttachment {
                testImage = attachment.image
            }
        }
        #expect(testImage?.pngData() == sampleImage.pngData())
    }
}
