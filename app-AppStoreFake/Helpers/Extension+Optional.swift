//
//  Extension+Optional.swift
//  app-AppStoreFake
//
//  Created by Walter Luis Deonísio Junior on 01/09/20.
//

import Foundation

extension Optional where Wrapped == Float {
    var valid: Float {
        switch self {
        case .some(let value):
            return value
        default:
            return 0.0
        }
    }
}
