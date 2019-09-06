//
//  Tracks.swift
//  iTunesTable
//
//  Created by Germán Santos Jaimes on 8/30/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

struct Results: Codable{
    var resultCount: Int
    var results: [Tracks]
}

struct Tracks: Codable{
    var trackName: String
    var artworkUrl100: String
}
