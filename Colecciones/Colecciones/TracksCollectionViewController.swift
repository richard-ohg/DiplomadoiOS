//
//  TracksCollectionViewController.swift
//  Colecciones
//
//  Created by Germán Santos Jaimes on 8/31/19.
//  Copyright © 2019 iosLab. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TracksCollectionViewController: UICollectionViewController {
    
    var tracks =  [Tracks]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(TrackCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        getTracks(cadena: "metallica")
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
    
        // Configure the cell
        
        let url = URL(string: tracks[indexPath.item].artworkUrl100 )
        
        
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            guard let data = data else { return }
            DispatchQueue.main.async{
                print(self.tracks[indexPath.item].artworkUrl100)
                cell.photoAlbum.image = UIImage(data: data)
            }
        }.resume()
        
        
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    // Seleccionamos un album y hacemos que gire
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Creamos el item a partir de la posición del indexPath
        
        let item = collectionView.cellForItem(at: indexPath) as! TrackCollectionViewCell
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
            item.photoAlbum.transform = CGAffineTransform(scaleX: -1, y: 1)
            //item.photoAlbum.transform = CGAffineTransform(scaleX: 10, y: 10)
            //item.transform = CGAffineTransform(scaleX: 10, y: 10)
            item.photoAlbum.transform = .identity
            //item.transform = .identity
            
        }, completion: nil)
        

    }
 

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
    
    func getTracks(cadena: String){
        let artista = cadena.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed )
        
        let url = URL(string: "https://itunes.apple.com/search?term=\(artista!)")
        
        print("https://itunes.apple.com/search?term=\(artista!)")
        let task = URLSession.shared.dataTask(with: url!){
            (data, response, error) in
            
            let jsonDecoder = JSONDecoder()
            
            if let data = data, let resultados = try? jsonDecoder.decode(Results.self, from: data){
                var temp:[Tracks] = []
                for track in resultados.results{
                    print(track.trackName, track.artworkUrl100)
                    temp.append(track)
                }
                self.tracks  = temp
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        
        task.resume()
        
    }
    

}
