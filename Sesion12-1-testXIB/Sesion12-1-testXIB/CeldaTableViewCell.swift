//
//  CeldaTableViewCell.swift
//  Sesion12-1-testXIB
//
//  Created by Ricardo Hernandez D4 on 9/14/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var titulo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
