//
//  AppsGroupCell.swift
//  app-AppStoreFake
//
//  Created by Walter Luis Deonísio Junior on 01/09/20.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    static let identifier = "AppsGroupCell"
    
    let horizontalController = AppsHorizontalController()
    let titleLabel = UILabel(text: "Apps Section", font: .boldSystemFont(ofSize: 30))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
    
        addSubview(horizontalController.view)
        addSubview(titleLabel)
        
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
