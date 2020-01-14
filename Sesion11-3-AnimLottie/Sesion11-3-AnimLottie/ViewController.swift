//
//  ViewController.swift
//  Sesion11-3-AnimLottie
//
//  Created by Ricardo Hernandez D4 on 9/13/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let animationView = AnimationView(name: "9318-globe")
        let animationView = AnimationView(name: "9350-liquid-animation-upload-icon")
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFill
        view.backgroundColor = .black
        view.addSubview(animationView)
        
        animationView.loopMode = .loop
        animationView.play()
        
        
    }


}

