//
//  TracksTableViewController.swift
//  Sesion7-2-iTunesTable
//
//  Created by Ricardo Hernandez D4 on 8/30/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

class TracksTableViewController: UITableViewController, UISearchBarDelegate {

    var tracks:[Tracks] = []
    
    let searchBarController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        getTracks()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.searchController = searchBarController
        navigationItem.hidesSearchBarWhenScrolling = false

        searchBarController.searchBar.delegate = self
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
        return tracks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        cell.textLabel?.text = tracks[indexPath.row].trackName

        return cell
    }
 
    func getTracks(cadena: String){
        
        let artista = cadena.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        
        let url = URL(string: "https://itunes.apple.com/search?term=\(artista!)")
        
        let task = URLSession.shared.dataTask(with: url!){
            (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            //    print(data)
            if let data = data, let results = try? jsonDecoder.decode(Results.self, from: data){
                self.tracks = []
                for track in results.results {
                    print(track.trackName)
                    self.tracks.append(track)
                }
//                Lo sacamos del hilo principal para que lo haga más rápido
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        task.resume()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        getTracks(cadena: searchText)
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
