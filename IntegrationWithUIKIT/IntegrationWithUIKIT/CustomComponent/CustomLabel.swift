//
//  Untitled.swift
//  IntegrationWithUIKIT
//
//  Created by Hirendra Sharma on 07/07/24.
//

import UIKit

class CustomLabel: UILabel {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = .red
        self.textColor = .white
    }
}
