//
//  BaseVC.swift
//  UL-Test
//
//  Created by Kerem Balaban on 17.02.2020.
//  Copyright © 2020 Creatif software. All rights reserved.
//

import UIKit
import MapKit
import JGProgressHUD
import UL_BackendService

class BaseVC: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView:MKMapView!
    let locationManager = CLLocationManager()
    let hud = JGProgressHUD(style: .dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            // Show alert letting the user know they have to turn this on.
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case .denied: // Show alert telling users how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
            break
        case .restricted: // Show an alert letting them know what’s up
            break
        case .authorizedAlways:
            break
        default:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
        }
    }
    
    func prepareMapAnnotation(user:User){
        let annotations = MKPointAnnotation()
        annotations.title = user.name
        annotations.coordinate = CLLocationCoordinate2D(latitude: Double(user.address.geo.lat)!, longitude: Double(user.address.geo.lng)!)
        mapView.addAnnotation(annotations)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: annotations.coordinate, span: span)
        mapView.setRegion(region, animated: false)
        
        mapView.isUserInteractionEnabled = false
        mapView.setCornerRadius(radius: 5)
        mapView.withBorder()
    }
    
    func prepareMapAnnotationList(users:[User]){
        users.forEach { (user) in
            let annotations = MKPointAnnotation()
            annotations.title = user.name
            annotations.coordinate = CLLocationCoordinate2D(latitude: Double(user.address.geo.lat)!, longitude: Double(user.address.geo.lng)!)
            mapView.addAnnotation(annotations)
        }
        
        mapView.setCornerRadius(radius: 5)
        mapView.withBorder()
    }
    
    
    func showHUD(message:String) {
        hud.vibrancyEnabled = true
        hud.textLabel.text = message
        hud.show(in: self.view)
    }
    
    func hideHUD() {
        hud.dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
