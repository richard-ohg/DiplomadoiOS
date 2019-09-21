//
//  AlumnosTableView.swift
//  Sesion13-1-InterfProgram
//
//  Created by Ricardo Hernandez D4 on 9/21/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class AlumnosTableView: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lista de Alumnos"
//        Para el titulo largo
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .red
        
//        Para cuando se scrolea la tabla
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white ]
//        Para que todo lo que se agregue en el navigationBar sea de coklor blanco el texto
        navigationController?.navigationBar.tintColor = .white
//        Para cuando se mueva la barra no se vuelva transparente
        navigationController?.navigationBar.isTranslucent = false
        
        tableView.backgroundColor = .azulMarino
//        Registramos en el table view una celda generica llamada "celda"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "celda")
//        Para que lo que sobre de la vista no se vean los renglones
        tableView.tableFooterView = UIView()
//        Color para separar los rows
        tableView.separatorColor = .red
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Agregar", style: .done, target: self, action: #selector(addAlumno))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel?.text = "alumno"
        cell.imageView?.image = UIImage(named: "images")
        cell.backgroundColor = .azulClaro
//        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    @objc func addAlumno(){
        print("foo")
        
        let addAlumnoController = AddAlumnoView()
//        present(addAlumnoController, animated: true)
        navigationController?.pushViewController(addAlumnoController, animated: true)
    }
}
