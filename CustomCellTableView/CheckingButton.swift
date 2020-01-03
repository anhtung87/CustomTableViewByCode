//
//  CheckingButton.swift
//  CustomCellTableView
//
//  Created by Hoang Tung on 1/3/20.
//  Copyright © 2020 Hoang Tung. All rights reserved.
//

import UIKit

class CheckingButton: UIButton {
    
    var status = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
        self.addTarget(self, action: #selector(checking), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func checking() {
        self.status = !self.status
        self.setBackgroundImage(UIImage(named: self.status ? "checked" : "unchecked"), for: .normal)
    }
    
}
