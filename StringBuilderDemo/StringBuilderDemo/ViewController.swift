//
//  ViewController.swift
//

import StringBuilder
import UIKit

class ViewController: UIViewController {
    
    let url = URL(string: "https://github.com")!
    let image = UIImage(systemName: "square.and.arrow.down")
    
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupText()
    }
    
    func setupView() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
    
    var trueOrFalse = Bool.random()
    var rating: Int = 3
    
    func setupText() {
        label.attributedText = NSAttributedString {
            Block {
                Block {
                    Text("This is a sample text")
                        .color(.label)
                    
                    Text(" with colored undeline")
                        .color(.systemTeal)
                        .underline(.single, color: .systemTeal)
                    
                    Text(" or strikethrough")
                        .color(.systemIndigo)
                        .strikethrough(.single, color: .systemIndigo)
                }
                .font(.boldSystemFont(ofSize: 22))
                
                Text(" AND STROKE")
                    .font(.italicSystemFont(ofSize: 24))
                    .stroke(5)
                    .color(.systemYellow)
                
                LineBreak(2)
                
                Text("You can check for any conditions and add ")
                
                if trueOrFalse {
                    Text("green text if true.")
                        .color(.systemGreen)
                } else {
                    Text("red text if false.")
                        .color(.systemPink)
                }
                
                LineBreak(2)
                
                Block {
                    Text("Use blocks to provide common attributes for group of components, such as font, color, paragraph style etc.")
                    
                    LineBreak()
                    
                    Text("red text")
                        .color(.systemRed)
                    LineBreak()
                    Text("green text")
                        .color(.systemGreen)
                    LineBreak()
                    Text("blue text")
                        .color(.systemBlue)
                    LineBreak()
                    
                    Text("attributes specified for components inside block will be applied only for that components, and common attributes also will be adde to all of the components inside the block")
                        .lineSpacing(5)
                }
                .font(.systemFont(ofSize: 18, weight: .medium))
                .backgroundColor(.secondarySystemBackground)
                .color(.systemPurple)
                
                
                LineBreak(2)
                
                Text("Add some images using loops or conditions, like this")
                    .font(.boldSystemFont(ofSize: 22))
                Space()
                
                for i in 0..<5 {
                    if i < rating {
                        Image(UIImage(systemName: "star.fill"))
                            .color(.systemYellow)
                    } else {
                        Image(UIImage(systemName: "star.fill"))
                            .color(.white)
                    }
                }
                
                LineBreak(2)
                
                Block {
                    Text("Links are also supported with ")
                    Link(url: url, alias: "link alias")
                        .underline(.single, color: .systemBlue)
                    Text(" or without ")
                    Link(url: url)
                        .underline(.single, color: .systemBlue)
                }
                .font(.monospacedDigitSystemFont(ofSize: 18, weight: .light))
            }
            .firstLineHeadIndent(20)
        }
    }
}

#Preview {
    ViewController()
}
