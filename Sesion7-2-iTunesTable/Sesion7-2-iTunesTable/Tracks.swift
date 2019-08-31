//
//  Tracks.swift
//  Sesion7-2-iTunesTable
//
//  Created by Ricardo Hernandez D4 on 8/30/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

struct Results: Codable{
    var resultCount: Int
    var results: [Tracks]
}

struct Tracks: Codable{
    var trackName: String
}
