//
//  TablitaViewController.swift
//  Sesion5-2-Tablas
//
//  Created by Ricardo Hernandez D4 on 8/23/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class TablitaViewController: UITableViewController {

    var alumnos = ["Jose", "Luis", "Sofia", "Pawis", "El manos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return alumnos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaTableViewCell

        cell.nombre.text = "Holaaaa"
//        cell.backgroundColor = .red
//        cell.textLabel?.text = alumnos[indexPath.row]

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cancelClosure = { (action: UIAlertAction) -> Void in
            print("Boton Cancelar")
        }
        
        let alerta = UIAlertController(title: "Titulo", message: "Este es el mensaje", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: cancelClosure)
        
        let okAction = UIAlertAction(title: "Borrar", style: .default){ (action) in
            //  Tiene que ir el self en un closure para referirte a kis atributos de una clase
            self.alumnos.remove(at: indexPath.row)
            print(self.alumnos)
            tableView.reloadData()
        }
//        let okAction2 = UIAlertAction(title: "Ok2", style: .default, handler: nil)
//        let okAction3 = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
//
        alerta.addAction(okAction)
        alerta.addAction(cancelAction)
//        alerta.addAction(okAction2)
//        alerta.addAction(okAction3)
//
        
        present(alerta, animated: true, completion: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            self.alumnos.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let deleteAction = UIContextualAction(style: .destructive, title: "Borrar") { (action, view, completionHandler) in
            self.alumnos.remove(at: indexPath.row)
            // Podemos poner el style .destructive o borrar a mano la celda
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        let otherAction = UIContextualAction(style: .normal, title: "Otra accion") { (action, view, completionHandler) in
            print("Otra accion")
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = .brown
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, otherAction])
        
        return swipeConfiguration
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let addAction = UIContextualAction(style: .normal, title: "Agregar") { (action, view, completionHandler) in
            print("Agregar")
            completionHandler(true)
        }
        
        addAction.backgroundColor = .blue
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [addAction])
        
        return swipeConfiguration
    }
    
//     Para hacer más grande
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.00
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "secondView" {
            return false
        }
        return true
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
