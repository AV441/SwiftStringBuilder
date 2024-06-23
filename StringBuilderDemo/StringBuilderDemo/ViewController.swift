//
//  ViewController.swift
//

import StringBuilder
import UIKit

class ViewController: UIViewController {
    
    let url = URL(string: "https://github.com")!
    let image = UIImage(systemName: "square.and.arrow.down")
    
    lazy var textView: UILabel = {
        let view = UILabel()
        view.backgroundColor = .secondarySystemFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.numberOfLines = 0
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
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.heightAnchor.constraint(equalToConstant: 200),
            textView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    var isOnline = true
    var rating: Int = 3
    
    func setupText() {
        textView.attributedText = NSAttributedString {
            Block {
                Text("Chat title")
                    .color(.label)
                LineBreak()
                Text("Author name")
                    .color(.systemTeal)
                LineBreak()
                Text("some message text...")
                    .color(.secondaryLabel)
            }
            .font(.systemFont(ofSize: 16))
            .lineHeight(minimum: 20)
            .alignment(.center)
            
            LineBreak(2)
            
            Block {
                Text("User Name")
                    .font(.boldSystemFont(ofSize: 22))
                    .color(.label)
                
                LineBreak()
                
                Block {
                    Text("is ")
                    
                    if isOnline {
                        Text("online")
                            .color(.systemGreen)
                    } else {
                        Text("offline")
                            .color(.systemRed)
                    }
                }
                .font(.italicSystemFont(ofSize: 16))
                
                LineBreak()
                
                Text("Rating")
                
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
            }
            .alignment(.center)
        }
    }
}

#Preview {
    ViewController()
}
