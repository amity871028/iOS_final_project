//
//  SongResults.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2019/5/22.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import Foundation

struct Song: Codable {
    var trackName: String
    var collectionName: String
    var previewUrl: URL?
    var artworkUrl100: URL
}

struct SongResults: Codable {
    var resultCount: Int
    var results: [Song]
}
