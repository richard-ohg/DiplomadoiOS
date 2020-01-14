//
//  Botoncito.swift
//  Sesion5-3-Boton
//
//  Created by Ricardo Hernandez D4 on 8/23/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class Botoncito: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
