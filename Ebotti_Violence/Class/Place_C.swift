//
//  Help_Line_C.swift
//  Ebotti_Violence
//
//  Created by Mv Mobile on 28/2/22.
//

import Foundation
import GoogleMaps

class Place_C{
    var Label: String?
    var Description: String?
    var Position:CLLocationCoordinate2D?
    
    init(){
        self.Label = ""
        self.Description = ""
        self.Position = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
    
    init(Label: String,Description: String,Position:CLLocationCoordinate2D){
        self.Label = Label
        self.Description = Description
        self.Position = Position
    }
    
    let main_view :UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.init(_colorLiteralRed: 248/255.0, green: 248/255.0, blue: 255/255.0, alpha: 1.0)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = UIColor(red: 243/255, green: 156/255, blue: 18/255, alpha: 1).cgColor
        v.layer.borderWidth = 0.3
        v.layer.cornerRadius = 5
        v.layer.masksToBounds = true
        return v
    }()
}
