//
//  TrackCollectionViewCell.swift
//  Colecciones
//
//  Created by Germán Santos Jaimes on 8/31/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class TrackCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var photoAlbum: UIImageView!
    
    override func awakeFromNib() {
        photoAlbum.backgroundColor = .black
        photoAlbum.layer.cornerRadius = 10
        photoAlbum.clipsToBounds = true
       
        
    }
    
}
