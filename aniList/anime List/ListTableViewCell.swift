//
//  ListTableViewCell.swift
//  aniList
//
//  Created by Oscar Navidad on 9/27/17.
//  Copyright © 2017 Adrim apps. All rights reserved.
//

import UIKit
import AlamofireImage

class ListTableViewCell: UITableViewCell {
     @IBOutlet weak var collectionView: UICollectionView!
    var delegate : animeListDelegate?
    var listCategory : Array<Anime> = []  {
        didSet {
            collectionView.reloadData()
        }
    }
}

extension ListTableViewCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ListCollectionViewCell
        let data = listCategory[indexPath.row]
        cell.imageView.af_setImage(withURL: URL(string: data.image_url_med!)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = listCategory[indexPath.row]
        delegate?.showDetail(data)
    }
    
}

extension ListTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
