//
//  AlbumVC.swift
//  UL-Test
//
//  Created by Kerem Balaban on 17.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import UIKit

class PhotosVC: UICollectionViewController {
    var photos:[Photo]!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photos"
    }
    
    // MARK: - Collection view data source
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
      return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let photo =  photos[indexPath.row]
        (cell.viewWithTag(1) as? UIImageView)?.downloaded(from: photo.thumbnailUrl, contentMode: .scaleAspectFit)

        return cell
    }
}


extension PhotosVC : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width / 3.0
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
