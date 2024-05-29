//
//  ViewController.swift
//

import StringBuilder
import UIKit

class ViewController: UIViewController {
    
    let url = URL(string: "https://github.com")!
    let image = UIImage(systemName: "square.and.arrow.down")
    
    lazy var textView: UITextView = {
        let view = UITextView()
        view.isEditable = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupText()
    }
    
    func setupView() {
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.heightAnchor.constraint(equalToConstant: 400),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24)
        ])
    }
    
    func setupText() {
        textView.attributedText = NSAttributedString {
            AttributedBlock {
                Text("Hello, World!")
                    .color(.systemCyan)
                    .underline(.thick, color: .separator)
                Space()
                Text("👋")
            } 
            .font(.boldSystemFont(ofSize: 40))
            .alignment(.center)
            
            LineBreak()
            LineBreak()
            LineBreak()
            
            AttributedBlock {
                Text("This is ")
                Text("String Builder Demo")
                    .font(.boldSystemFont(ofSize: 24))
                    .color(.systemGreen)
                Text(", created to show basic abilities of the library.")
            }
            .font(.systemFont(ofSize: 20))
            .color(.label)
            .lineSpacing(4)
            
            LineBreak()
            LineBreak()
            
            AttributedBlock {
                Attachment(image)
                Space()
                Link(url: url, alias: "Link to GitHub repository")
            }
            .color(.link)
            .font(.italicSystemFont(ofSize: 24))
            .underline(.single, color: .link)
        }
    }
}

#Preview {
    ViewController()
}
