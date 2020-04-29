//
//  MapVC.swift
//  Bear Bikes
//
//  Created by Ian Shen on 4/28/20.
//  Copyright © 2020 Bear Bikes Team. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {

    @IBOutlet weak var map: MKMapView!

   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.performSegue(withIdentifier: "toBarcodeVC", sender: self)
                
    }
    

}
