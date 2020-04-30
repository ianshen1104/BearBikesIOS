//
//  MapVC.swift
//  Bear Bikes
//
//  Created by Ian Shen on 4/28/20.
//  Copyright © 2020 Bear Bikes Team. All rights reserved.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController, GMSMapViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.8721, longitude: -122.2578, zoom: 14.7)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView.delegate = self
        self.view.addSubview(mapView)
        
        BikeManager.shared.retrieveBikes(mapView)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //reload the map
        
    }
    
    
    
    @IBAction func barcodePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toBarcodeVC", sender: self)
    }
    
    

}
