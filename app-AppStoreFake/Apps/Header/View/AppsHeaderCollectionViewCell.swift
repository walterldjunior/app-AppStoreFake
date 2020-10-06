//
//  AppsHeaderCollectionViewCell.swift
//  app-AppStoreFake
//
//  Created by Walter Luis Deonísio Junior on 01/09/20.
//

import UIKit

class AppsHeaderCollectionViewCell: UICollectionViewCell {
    static let identifier = "AppsHeaderCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 16
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
