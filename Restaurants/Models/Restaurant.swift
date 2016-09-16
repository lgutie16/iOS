//
//  Restaurant.swift
//  Restaurants
//
//  Created by admin on 3/09/16.
//  Copyright © 2016 eafit. All rights reserved.
//

import Foundation

class Restaurant {
    
    var name:String
    var details:String
    var address:String
    var phone:String
    var latitude:Double
    var longitude:Double
    var category:String
    var wifi:Bool
    var available:Bool
    var ranking:Float
    var image:String
    
    //Inicializador designado
    init(name:String, details:String, address:String, phone:String, latitude:Double, longitude:Double, category:String, wifi:Bool, available:Bool, ranking:Float, image:String) {
        self.name = name
        self.details = details
        self.address = address
        self.phone = phone
        self.latitude = latitude
        self.longitude = longitude
        self.category = category
        self.wifi = wifi
        self.available = available
        self.ranking = ranking
        self.image = image
    }
    
    //Inicializador por convenencia
    convenience init(name:String, address:String, latitude:Double, longitude:Double, category:String, image:String){
        self.init(name: name, details: "Detalle del restaurant mostrado en cada item", address: address, phone: "000000", latitude: latitude, longitude: longitude, category: category, wifi: false, available: true, ranking: 3.0, image: image)
    }
    
}