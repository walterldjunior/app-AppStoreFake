//
//  AppRowCell.swift
//  app-AppStoreFake
//
//  Created by Walter Luis Deonísio Junior on 01/09/20.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    static let identifier = "AppRowCell"
    
    lazy var nameLabel =  UILabel(text: "App name", font: .systemFont(ofSize: 16))
    lazy var companyLabel = UILabel(text: "Company Name ", font: .systemFont(ofSize: 13))
    lazy var appIconImageView = UIImageView(cornerRadius: 8)
    lazy var getButton = UIButton(title: "GET")
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    fileprivate func setConstraints() {
        appIconImageView.constrainWidth(constant: 64)
        appIconImageView.constrainHeight(constant: 64)
        appIconImageView.backgroundColor = .purple
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32/2
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        let stackView = UIStackView(arrangedSubviews: [appIconImageView, VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4), getButton])
        stackView.alignment = .center
        stackView.spacing = 16
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
