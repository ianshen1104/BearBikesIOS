//
//  BikeManager.swift
//  Bear Bikes
//
//  Created by Ian Shen on 4/29/20.
//  Copyright © 2020 Bear Bikes Team. All rights reserved.
//

import Foundation

class BikeManager {
    
    static var bikeList: [Bike] = []
    static var clickedBike: Bike!
        
    static func retrieveBikes(){
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
                
                if !bikeList.contains(bike){
                    bikeList.append(bike)
                }
            }
        })
    }

}
