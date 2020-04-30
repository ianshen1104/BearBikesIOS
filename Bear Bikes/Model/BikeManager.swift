//
//  BikeManager.swift
//  Bear Bikes
//
//  Created by Ian Shen on 4/29/20.
//  Copyright © 2020 Bear Bikes Team. All rights reserved.
//

import Foundation
import GoogleMaps

class BikeManager {
    
    static var shared = BikeManager()
    
    
    let customMarkerWidth: Int = 50
    let customMarkerHeight: Int = 70
    
    private init() {
        //Keep for singleton
    }
    
    
    var bikeList: [Bike] = []
    var clickedBike: Bike!
    
    
    func retrieveBikes(_ mapView: GMSMapView){
        let ref = AppManager.db
        let bikeRef = ref.child("bikes")
        bikeRef.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let usersDict = snapshot.value as? [String: [String: Any]] else {
                print("Can't find bikes dictionary")
                return
            }
            for (bikeID, _) in usersDict {
                guard let userInfoDict = usersDict[bikeID] else {
                    print("Can't find event")
                    continue
                }
                let bike = Bike(color: userInfoDict["color"]! as! String, id: userInfoDict["id"]! as! String, latitude: userInfoDict["latitude"]! as! Double, longitude: userInfoDict["longitude"]! as! Double, origin: userInfoDict["origin"]! as! String)
                
                if !self.bikeList.contains(bike){
                    self.bikeList.append(bike)
                }
            }
            
            for bike in self.bikeList {
                self.styleMarker(self.addMarker(bike, mapView))
            }
        })
    }

    func addMarker(_ bike: Bike, _ mapView: GMSMapView) -> GMSMarker {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: bike.latitude, longitude: bike.longitude)
        marker.title = bike.origin
        marker.snippet = bike.color
        marker.map = mapView
        return marker
    }
    
    func styleMarker(_ marker: GMSMarker) {
//        guard let customMarkerView = marker.iconView as? MapMarkerView else { print("Error: customMarkerView")
//            return
//        }
        let customMarker = MapMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), image: UIImage(named: "bearbikeLogo")!, color: (marker.snippet == "blue") ? UIColor(displayP3Red: 0.096, green: 0.209, blue: 0.419, alpha: 0.8) : UIColor(displayP3Red: 0.794, green: 0.677, blue: 0.087, alpha: 0.8))
        marker.iconView = customMarker
    }
}
