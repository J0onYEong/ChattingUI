//
//  ViewController.swift
//  
//
//  Created by 최준영 on 6/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let chattingStackView: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.backgroundColor = .black
        
        return stackView
    }()
    
    private static let placeHolderString = "채팅을 입력하세요"
    
    private let chattingFieldBox: UIView = {
        let view = UIView()
        
        view.backgroundColor = .lightGray
        
        view.layoutMargins = .init(top: 5, left: 10, bottom: 5, right: 10)
        
        return view
    }()
    
    private let chattingField: MyTextView = {
        
        let textView = MyTextView()
        
        textView.textAlignment = .left
        textView.backgroundColor = .white
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.clipsToBounds = true
        textView.layer.cornerRadius = 2.5
        
        return textView
    }()
    
    private lazy var chatScreen: UITableView = {
        
        let tableView = UITableView()
        
        tableView.backgroundColor = .yellow
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onChatScreenTapped(_:)))
                                                
        tableView.addGestureRecognizer(tapGesture)
        
        return tableView
    }()
    
    @objc
    func onChatScreenTapped(_ sender: UITapGestureRecognizer) {
        
        chattingField.resignFirstResponder()
    }
    
    private let screenStack: UIStackView = {
        
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        return stackView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .brown
        
        [
            screenStack
        ]
            .forEach { view in
                
                view.translatesAutoresizingMaskIntoConstraints = false
                self.view.addSubview(view)
            }
        
        NSLayoutConstraint.activate([
            screenStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            screenStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            screenStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            screenStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        setAutoLayout_screenStack()
        setAutoLayout_chattingArea()
        
        setKeyboardAvoidance()
    }
    
    func setAutoLayout_screenStack() {
        
        [
            chatScreen,
            chattingStackView
        ].forEach { view in
            
            view.translatesAutoresizingMaskIntoConstraints = false
            screenStack.addArrangedSubview(view)
        }
        chatScreen.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    func setAutoLayout_chattingArea() {
        
        let plusItem = ChattingBoxItem(width: 36, height: 36)
        plusItem.backgroundColor = .blue
        let sendItem = ChattingBoxItem(width: 36, height: 36)
        sendItem.backgroundColor = .blue
        
        plusItem.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        sendItem.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        plusItem.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        sendItem.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        chattingField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            
        // chattingFieldBox
        [
            chattingField
        ].forEach { view in
            
            view.translatesAutoresizingMaskIntoConstraints = false
            chattingFieldBox.addSubview(chattingField)
        }
        
        NSLayoutConstraint.activate([
            
            chattingField.topAnchor.constraint(equalTo: chattingFieldBox.layoutMarginsGuide.topAnchor),
            chattingField.leadingAnchor.constraint(equalTo: chattingFieldBox.layoutMarginsGuide.leadingAnchor),
            chattingField.trailingAnchor.constraint(equalTo: chattingFieldBox.layoutMarginsGuide.trailingAnchor),
            chattingField.bottomAnchor.constraint(equalTo: chattingFieldBox.layoutMarginsGuide.bottomAnchor),
        ])
        
        // chattingStackView
        [
            plusItem,
            chattingFieldBox,
            sendItem
        ].forEach { view in
            
            view.translatesAutoresizingMaskIntoConstraints = false
            chattingStackView.addArrangedSubview(view)
        }
    }
    
    func setKeyboardAvoidance() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardAction(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardAction(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func onKeyboardAction(_ notification: Notification) {
        
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        let willMoveConstant = keyboardFrame.height - view.safeAreaInsets.bottom
        
        UIView.animate(withDuration: duration) { [weak self] in
            
            switch notification.name {
            case UIResponder.keyboardWillShowNotification:
                
                self?.screenStack.transform = CGAffineTransform(translationX: 0, y: -willMoveConstant)
            case UIResponder.keyboardWillHideNotification:
                
                UIView.animate(withDuration: duration) { [weak self] in
                    
                    self?.screenStack.transform = .identity
                }
            default:
                return
            }
        }
    }
}

