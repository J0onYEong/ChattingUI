//
//  ChattingBoxItem.swift
//  ChattingUI
//
//  Created by choijunios on 6/27/24.
//

import UIKit

class ChattingBoxItem: UIView {
    
    let width: CGFloat
    let height: CGFloat
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override var intrinsicContentSize: CGSize {
        
        CGSize(width: width, height: height)
    }
}
