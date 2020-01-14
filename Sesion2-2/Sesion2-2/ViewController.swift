//
//  ViewController.swift
//  Sesion2-2
//
//  Created by 2020-1 on 8/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changed(_ sender: UISlider) {
//        print(slider.value)
        let value = slider.value
        let value2 = slider2.value
        let value3 = slider3.value
        
        view.backgroundColor = UIColor(red: CGFloat(value), green: CGFloat(value2), blue: CGFloat(value3), alpha: 1.0)
    }
    
}

