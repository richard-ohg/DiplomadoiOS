//
//  SecondViewController.swift
//  Sesion12-1-testXIB
//
//  Created by Ricardo Hernandez D4 on 9/14/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tabla: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CeldaTableViewCell", bundle: nil)
//        A la table le agregue a la celda
        tabla.register(nib, forCellReuseIdentifier: "celda")
//        Otra forma de delegar
        tabla.dataSource = self
        tabla.delegate = self

    }
}

extension SecondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaTableViewCell
        
        cell.titulo.text = "Es harina!!!"
//        cell.foto.image = UIImage(named: "harina")
        cell.foto.image = UIImage(named: "esHarina")
        
        return cell
    }
}

extension SecondViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}
