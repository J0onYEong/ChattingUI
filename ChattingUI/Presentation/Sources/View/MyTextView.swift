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
        
        
        // top, bottom값이 0이면 입력창이 너무좁아진다.
        
        
        // contentInset은 내부컨텐츠 전체를 의미한다.
        
        // textContainerInset은 텍스트 필드 내부의 텍스트 상자의 인셋을 의미한다.
        self.textContainerInset = .init(top: 5, left: 5, bottom: 5, right: 5)
        self.textContainer.lineFragmentPadding = 0
        
        // textContainer.lineFragmentPadding은 텍스트 상자의 왼쪽 여백을 의미한다.
        // textContainer와 textContainerInset는 Scroll상태일때만 잘동작한다.
        // 두개가 동시에 설정되어 있고 ScrollEnabled가 false라면 양립하지 못하고 서로 밀어내게되어 UI가 깨진다. 주의하자
        
        placeHolderLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(placeHolderLabel)
        
        NSLayoutConstraint.activate([
            placeHolderLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
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
