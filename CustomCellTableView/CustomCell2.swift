//
//  CustomCell2.swift
//  CustomCellTableView
//
//  Created by Hoang Tung on 12/31/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

class CustomCell2: UITableViewCell {
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let languageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .black
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    let checkingButton: CheckingButton = {
        let button = CheckingButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .systemGray5
        setupLayout()
    }
    
    func setupLayout() {
        self.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        
        containerView.addSubview(languageImageView)
        languageImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2).isActive = true
        languageImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2).isActive = true
        languageImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.2).isActive = true
        languageImageView.heightAnchor.constraint(equalTo: languageImageView.widthAnchor, multiplier: 1).isActive = true
        
        containerView.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: languageImageView.topAnchor, constant: 0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: languageImageView.trailingAnchor, constant: 8).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: languageImageView.heightAnchor, multiplier: 0.5).isActive = true
        
        containerView.addSubview(detailLabel)
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        detailLabel.leadingAnchor.constraint(equalTo: languageImageView.trailingAnchor, constant: 8).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        detailLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 600).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2).isActive = true
        
        containerView.addSubview(checkingButton)
        checkingButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor, constant: 0).isActive = true
        checkingButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        checkingButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        checkingButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
