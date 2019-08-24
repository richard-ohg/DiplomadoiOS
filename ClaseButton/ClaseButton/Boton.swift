//
//  Boton.swift
//  ClaseButton
//
//  Created by Germán Santos Jaimes on 3/13/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

class Boton: UIButton{
    
    override func awakeFromNib() {
        backgroundColor = .red
        layer.cornerRadius = 30
        
    }
    
    func shake(){
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x, y:center.y - 5)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x, y: center.y + 5)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
    
}
