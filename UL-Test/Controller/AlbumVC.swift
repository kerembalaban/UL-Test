//
//  AlbumVC.swift
//  UL-Test
//
//  Created by Kerem Balaban on 17.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import UIKit
import UL_BackendService

class AlbumVC: BaseTableVC {
    
    var albums:[Album] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Album"
        navigationItem.rightBarButtonItem = nil
    }
    
    func showPhotosBySelectedAlbum(albumId:Int){
        super.showHUD(message: "Fetching albums")
        BackendService.sharedInstance.fetchPhotosBySelectedAlbum(id:albumId, completion: { (photosList,error) in
            super.hideHUD()
            if (error == nil){
                self.showPhotos(photos: photosList)
            }else{
                self.showErrorString(error: error!.localizedDescription)
            }
        })
    }
    
    func showPhotos(photos:[Photo]){
        guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "photosVC") as? PhotosVC else {
              return
        }
        destinationVC.photos = photos
        navigationController?.pushViewController(destinationVC, animated: true)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath)
        let album = albums[indexPath.row]
        cell.textLabel?.text = album.title
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        showPhotosBySelectedAlbum(albumId: album.id)
    }

}
