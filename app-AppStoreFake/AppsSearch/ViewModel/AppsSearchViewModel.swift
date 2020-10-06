//
//  AppsSearchViewModel.swift
//  app-AppStoreFake
//
//  Created by Walter Luis Deonísio Junior on 01/09/20.
//

import Foundation

class AppsSearchViewModel {
    
    var appsResult: [SearchAppResult] = [] {
        didSet {
            appsSearchDidUpdate?()
        }
    }
    
    var appsSearchDidUpdate: (() -> Void)?
    
    var count: Int {
        appsResult.count
    }
    
    func fetchApps(searchTerm: String) {
        Service.fetchApps(searchTerm: searchTerm) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let appsResult):
                self.appsResult = appsResult
            case .failure:
                self.appsSearchDidUpdate?()
            }
        }
    }
}
