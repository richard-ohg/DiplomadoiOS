//
//  ListTableViewController.swift
//  Sesion9-1-Firebase
//
//  Created by Ricardo Hernandez D4 on 9/6/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class ListTableViewController: UITableViewController {

    var productos = [Producto]()
//    var productos: [Producto] = [] // Otra forma de ponerlo
    
    var ref: DocumentReference! // Te conecta a la coleccion
    var getRef: Firestore! // Te conecta a la base
    var storageReference: StorageReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRef = Firestore.firestore()
        storageReference = Storage.storage().reference()
        
        getProducts()
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
        return productos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        
        cell.textLabel?.text = productos[indexPath.row].nombre
        
        let userImageRef = storageReference.child("/photos").child(productos[indexPath.row].id)
        
        userImageRef.downloadURL { (url, error) in
            if let error = error{
                print(error.localizedDescription)
                cell.imageView?.image = UIImage(named: "jordan")
            }else{
//                print(String(describing: url!))
                URLSession.shared.dataTask(with: url!){
                    (data, _, _) in
                    guard let data = data else {return}
                    DispatchQueue.main.async {
                        cell.imageView?.image = UIImage(data: data)
//                        self.tableView.reloadData()
                    }
                }.resume()
            }
        }
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editView"{
            let indexPath = tableView.indexPathForSelectedRow
            
            let editView = segue.destination as? EditViewController
            
            editView?.datosProducto = productos[(indexPath?.row)!]
        }
    }
    
    // Forma sencilla para dar el swipe
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
            let producto = self.productos[indexPath.row]
            self.getRef.collection("productos").document(producto.id).delete()
        }
        
        return [delete]
    }
    
    func getProducts(){
//        getRef.collection("productos").getDocuments { (querySnapshot, error) in
        // Siempre tenemos en escucha los cambios de la db
        getRef.collection("productos").addSnapshotListener({ (querySnapshot, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }else{
                self.productos = []
                for document in querySnapshot!.documents{
                    let id = document.documentID
                    let values = document.data()
                    let nombre = values["nombre"] as? String ?? "sin valor"
                    let precio = values["precio"] as? String ?? "sin precio"
                    self.productos.append(Producto(nombre: nombre, precio: precio, id: id))
                    
                }
            self.tableView.reloadData()
            }
        })
    }
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
