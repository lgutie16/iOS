//
//  RestaurantServices.swift
//  Restaurants
//
//  Created by admin on 10/09/16.
//  Copyright © 2016 eafit. All rights reserved.
//

import UIKit
import Alamofire

public typealias CompletionHandlerGet = (success: Bool, response:[[String: AnyObject]]) ->()

let headers = ["Authorization":"Basic a2lkX1N5U2h3cVdoOjY5YWY4OTFmN2ZlOTRkYmZhODkwZjBlNTg1ZTE1NjU1", "Content-Type":"application/x-www-form-urlencoded"]


    
    class RestaurantService: NSObject {
        let url = "https://baas.kinvey.com/appdata/kid_SyShwqWh/restaurants"
        
        func getRestaurants(completion:CompletionHandlerGet){
            Alamofire.request(.GET, url, parameters: nil, headers: headers)
                .responseJSON(){response in
                    
                    switch response.result {
                    case .Success(let JSON):
                        print("Llamado de GET \(JSON)")
                        completion(success: true, response: JSON as! [[String : AnyObject]])
                    case .Failure(let error):
                        completion(success: false, response: [["error":error.localizedDescription]])
                    }
            }
        }
        
    }


