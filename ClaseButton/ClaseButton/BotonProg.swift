//
//  BotonProg.swift
//  ClaseButton
//
//  Created by Germán Santos Jaimes on 3/13/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class BotonProg: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 50
        self.backgroundColor = .cyan
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
