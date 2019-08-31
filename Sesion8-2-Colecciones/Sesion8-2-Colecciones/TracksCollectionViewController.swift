//
//  TracksCollectionViewController.swift
//  Sesion8-2-Colecciones
//
//  Created by Ricardo Hernandez D4 on 8/31/19.
//  Copyright © 2019 Ricardo Hernandez D4. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TracksCollectionViewController: UICollectionViewController {

    var tracks = [Tracks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTracks(cadena: "jose jose")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(TrackCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return tracks.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TrackCollectionViewCell
        
        guard let url = URL(string: tracks[indexPath.item].artworkUrl100) else{return cell}
        
        URLSession.shared.dataTask(with: url){
            (data, _, _) in
            guard let data = data else {return}
            DispatchQueue.main.async {
                cell.imagen.image = UIImage(data: data)
            }
        }.resume()
        
        
        
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
                    self.collectionView.reloadData()
                }
            }
        }
        
        task.resume()
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
