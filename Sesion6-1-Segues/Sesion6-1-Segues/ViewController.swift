//
//  ViewController.swift
//  Sesion6-1-Segues
//
//  Created by Ricardo Hernandez D4 on 8/24/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var users: [User] = [
        User(email: "aloo@xxx.com", user: "cosita", password: "1234")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        print("viewDidLoad")
    }
    
    // Para hacer un refresh de la vista
    override func viewWillAppear(_ animated: Bool) {
        print(users)
    }
    
    override func viewDidAppear(_ animated: Bool) {
      // print("viewDidApper")
        let defaults = UserDefaults.standard
        
        let statusUser = defaults.bool(forKey: "statusUser")
        if statusUser{
            print("Usuario Autenticado")
        }else{
            // Mandamos la nueva vista mediante el segue
            performSegue(withIdentifier: "thirdView", sender: self)
        }
    }
    
    @IBAction func cerrarSesion(_ sender: UIBarButtonItem) {
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "statusUser")
        performSegue(withIdentifier: "thirdView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! UserTableViewCell
        
        cell.email.text = users[indexPath.row].email
        cell.user.text = users[indexPath.row].user
        cell.password.text = users[indexPath.row].password
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addUser"{
            // Inyección -> creas la vista a donde quieras mandarte y te
            let addView = segue.destination as! AddUserViewController
            addView.viewController = self
        }
    }


}

