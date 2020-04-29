//
//  MapVC.swift
//  Bear Bikes
//
//  Created by Ian Shen on 4/28/20.
//  Copyright © 2020 Bear Bikes Team. All rights reserved.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.8721, longitude: -122.2578, zoom: 14.5)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        addBikes()
        for bike in bikeList {
            addMarker(bike, mapView)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        BikeManager.retrieveBikes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //reload the map
        
    }

    func addMarker(_ bike: Bike, _ mapView: GMSMapView) {
      let marker = GMSMarker()
      marker.position = CLLocationCoordinate2D(latitude: bike.latitude, longitude: bike.longitude)
      marker.title = bike.origin
      marker.snippet = bike.color
      marker.map = mapView
    }
    
    
    
    @IBAction func barcodePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "toBarcodeVC", sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    //Mock list for temp demo because BikeManager.retrieveBikes() isn't working
    var bikeList: [Bike] = []
    
    func addBikes() {
        let bike1 = Bike(color: "blue", id: "1238dsfQct2SF", latitude: 37.8711, longitude: -122.2578 , origin: "The Campanile")
        bikeList.append(bike1)
        let bike2 = Bike(color: "yellow", id: "12323djakAFDQ3fd", latitude: 37.869, longitude: -122.2552 , origin: "Unit 1")
        bikeList.append(bike2)
        let bike3 = Bike(color: "yellow", id: "aFA3j490oewn", latitude: 37.8676, longitude: -122.2552 , origin: "Unit 1")
        bikeList.append(bike3)
        let bike4 = Bike(color: "blue", id: "qWE341jcdks493", latitude: 37.8664, longitude: -122.2548 , origin: "Unit 2")
        bikeList.append(bike4)
        let bike5 = Bike(color: "yellow", id: "kaTMe32910cSD", latitude: 37.8672, longitude: -122.2604 , origin: "Unit 3 - The Best Unit.")
        bikeList.append(bike5)
        let bike5M = Bike(color: "blue", id: "asEfj3892cjD", latitude: 37.872685, longitude: -122.260224 , origin: "Blackwell")
        bikeList.append(bike5M)
        let bike6 = Bike(color: "yellow", id: "dka23WERa3218", latitude: 37.875, longitude: -122.256 , origin: "Foothill")
        bikeList.append(bike6)
        let bike7 = Bike(color: "yellow", id: "ac3kADF9fk199", latitude: 37.870586, longitude: -122.260257 , origin: "Blackwell")
        bikeList.append(bike7)
        let bike8 = Bike(color: "yellow", id: "FDSjfewo34", latitude: 37.8642, longitude: -122.2489 , origin: "Clark Kerr")
        bikeList.append(bike8)
    }
}
