//
//  MyTextView.swift
//  ChattingUI
//
//  Created by choijunios on 6/27/24.
//

import UIKit

class MyTextView: UITextView {
    
    let placeHolderLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "메세지를 입력하세요"
        label.textColor = .lightGray
        
        return label
        
    }()
        
    required init?(coder: NSCoder) { fatalError() }
    
    init() {
        
        super.init(frame: .zero, textContainer: nil)
        
        self.delegate = self
        self.autocapitalizationType = .none
        
        placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(placeHolderLabel)
        
        NSLayoutConstraint.activate([
            placeHolderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            placeHolderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    override func draw(_ rect: CGRect) {
        
        placeHolderLabel.font = self.font
        super.draw(rect)
    }
}

extension MyTextView: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        placeHolderLabel.isHidden = true
    }
        
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.isEmpty {
            placeHolderLabel.isHidden = false
        }
    }
}
