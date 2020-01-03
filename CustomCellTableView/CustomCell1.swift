//
//  CustomCell1.swift
//  CustomCellTableView
//
//  Created by Hoang Tung on 12/31/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

class CustomCell1: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.backgroundColor = .systemPink
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
