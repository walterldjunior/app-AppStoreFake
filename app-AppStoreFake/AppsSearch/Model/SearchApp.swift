//
//  SearchApp.swift
//  app-AppStoreFake
//
//  Created by Walter Luis Deonísio Junior on 01/09/20.
//

import Foundation

struct SearchApp: Codable {
    let resultCount: Int
    let results: [SearchAppResult]
    
}
struct SearchAppResult: Codable {
    let trackName: String
    let primaryGenreName: String
    let artworkUrl100: String
    let screenshotUrls: [String]
    let averageUserRating: Float?
}
