//
//  AppsPageHeader.swift
//  app-AppStoreFake
//
//  Created by Walter Luis Deonísio Junior on 01/09/20.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    static let identifier = "AppsPageHeader"
    
    let appsPageHeaderController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(appsPageHeaderController.view)
        self.appsPageHeaderController.view.fillSuperview()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
