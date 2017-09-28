//
//  ListCollectionViewController.swift
//  aniList
//
//  Created by Oscar Navidad on 9/26/17.
//  Copyright © 2017 Adrim apps. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

private let reuseIdentifier = "Cell"

class ListCollectionViewController: UICollectionViewController {

    var animeList : Array<Anime> = []
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return animeList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ListCollectionViewCell
        // Configure the cell
        let data = animeList[indexPath.row]
        let urlImage = URL(string: data.image_url_med!)
        cell.imageView.af_setImage(withURL: urlImage!)
       
        return cell
    }


}

// MARK: HTTPRequest
extension ListCollectionViewController {
    
}
