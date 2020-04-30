//
//  MapMarkerView.swift
//  Bear Bikes
//
//  Created by Ian Shen on 4/30/20.
//  Copyright © 2020 Bear Bikes Team. All rights reserved.
//

import Foundation
import UIKit

class MapMarkerView: UIView {
    var img: UIImage!
    var color: UIColor!
    
    init(frame: CGRect, image: UIImage, color: UIColor) {
        super.init(frame: frame)
        self.img = image
        self.color = color
        setupViews()
    }
    
    func setupViews() {
        let imgView = UIImageView(image: img)
        imgView.frame=CGRect(x: 0, y: 0, width: 50, height: 50)
        imgView.layer.cornerRadius = 25
        imgView.layer.borderColor = color?.cgColor
        imgView.layer.backgroundColor = color?.cgColor
        imgView.layer.borderWidth = 4
        imgView.clipsToBounds = true
        let lbl=UILabel(frame: CGRect(x: 0, y: 45, width: 50, height: 10))
        lbl.text = "▾"
        lbl.font=UIFont.systemFont(ofSize: 24)
        lbl.textColor = color
        lbl.textAlignment = .center
        
        self.addSubview(imgView)
        self.addSubview(lbl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
