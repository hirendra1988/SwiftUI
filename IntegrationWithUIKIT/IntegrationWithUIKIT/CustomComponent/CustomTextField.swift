//
//  Untitled.swift
//  IntegrationWithUIKIT
//
//  Created by Hirendra Sharma on 07/07/24.
//

import UIKit

class CustomTextField: UITextField {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = .orange
        self.textColor = .white
    }
}
