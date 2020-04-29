//
//  Bike.swift
//  Bear Bikes
//
//  Created by Ian Shen on 4/28/20.
//  Copyright © 2020 Bear Bikes Team. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class Bike: Equatable{

    var color: String
    var id: String
    var latitude: Double
    var longitude: Double
    var origin: String
    
    init(color: String, id: String, latitude: Double, longitude: Double, origin: String) {
        self.color = color
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.origin = origin
    }
    
    static func == (lhs: Bike, rhs: Bike) -> Bool {
        return lhs.id == rhs.id
    }
}
