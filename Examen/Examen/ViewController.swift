//
//  ViewController.swift
//  Examen
//
//  Created by Ricardo Hernández González on 29/11/19.
//  Copyright © 2019 unam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var imagen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scroll.delegate = self
        scroll.minimumZoomScale = 1.0
        scroll.maximumZoomScale = 2.0
//        scroll.zoomScale = 1.0
        // Do any additional setup after loading the view.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imagen
    }


    @IBAction func change(_ sender: UISegmentedControl) {
        print("cambio")
        
        print(sender.selectedSegmentIndex)
    }
}

