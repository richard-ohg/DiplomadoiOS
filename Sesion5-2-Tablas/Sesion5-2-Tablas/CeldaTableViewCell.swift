//
//  CeldaTableViewCell.swift
//  Sesion5-2-Tablas
//
//  Created by Ricardo Hernandez D4 on 8/23/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class CeldaTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
