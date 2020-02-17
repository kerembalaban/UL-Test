//
//  MapVC.swift
//  UL-Test
//
//  Created by Kerem Balaban on 17.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import UIKit
import MapKit
import UL_BackendService

class MapVC: BaseVC {
    var users:[User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            checkLocationServices()
            prepareUsersMapAnnotation()
    }
    
    func prepareUsersMapAnnotation() {
        super.prepareMapAnnotationList(users: users)
    }
    
    func showUserDetail(user:User){
         guard let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "userDetailVC") as? UserDetailVC else {
              return
        }
        destinationVC.selectedUser = user
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let filteredUser = users.filter {
            $0.name == view.annotation?.title!
        }
        
        if filteredUser.count > 0 {
            showUserDetail(user: filteredUser.first!)
        }
    }
    
}
