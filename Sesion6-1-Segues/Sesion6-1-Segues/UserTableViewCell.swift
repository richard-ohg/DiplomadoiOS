//
//  UserTableViewCell.swift
//  Sesion6-1-Segues
//
//  Created by Ricardo Hernandez D4 on 8/24/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var password: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
