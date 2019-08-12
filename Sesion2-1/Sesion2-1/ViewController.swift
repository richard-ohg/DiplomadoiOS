//
//  ViewController.swift
//  Sesion2-1
//
//  Created by 2020-1 on 8/10/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saludo: UILabel!
    
    var toogle:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        saludo.text = "Foo Bar"
    }
    
    @IBAction func cambiarColor(_ sender: UIButton) {
//        if toogle{
//            saludo.textColor = UIColor.blue
//            sender.tag
//        }else{
//            saludo.textColor = UIColor.black
//        }
        
//        if sender.tag == 0{
//            saludo.textColor = UIColor.red
//        }else{
//            saludo.textColor = UIColor.blue
//        }
        
//        toogle = !toogle
        
    }
}

