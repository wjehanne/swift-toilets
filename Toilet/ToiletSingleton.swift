//
//  DataToilet.swift
//  Toilet
//
//  Created by William JEHANNE on 08/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import MapKit

class ToiletSingleton {
    
    static var _instance: ToiletSingleton?
    static var instance: ToiletSingleton {
        get {
            if (_instance == nil) {
                _instance = ToiletSingleton()
            }
            
            return _instance!
        }
    }
    
    var _toilets: [Toilet]?
    var toilet: [Toilet] {
        get {
            if(_toilets == nil) {
                _toilets = fetchAllToilet()
            }
            
            return _toilets!
        }
    }
    
    private init() { }
    
    func fetchAllToilet()-> [Toilet] {
        let url = NSURL(string: "http://scenies.com/insset_api/resources/toilets.json")
        
        let data = NSData(contentsOfURL: url!)
        let json = JSON(data: data!)
        
        var toilets = [Toilet]()
        
        for i in 0..<json.count {
        
            
            let location = CLLocationCoordinate2D(latitude: json[i]["coordinates"]["latitude"].doubleValue, longitude: json[i]["coordinates"]["longitude"].doubleValue)
            let toilet = Toilet(id: json[i]["id"].intValue, title: String(json[i]["name"]), coordinate: location)

            
            toilets.append(toilet)
        }
        
        return toilets
        
        /*Alamofire.request(.GET, "http://scenies.com/insset_api/resources/toilets.json")
            .responseJSON { response in
                
                switch response.result {
                case .Success(let data):
                    let json = JSON(data)
                    
                    for i in 0..<json.count {
                        let id:Int = json[i]["id"].intValue
                        let name:String = json[i]["name"].stringValue
                        let longitude:Double = json[i]["coordinates"]["longitude"].doubleValue
                        let latitude:Double = json[i]["coordinates"]["latitude"].doubleValue
                        
                        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                        
                        let toilet = Toilet(id: id, title: name, coordinate: location)
                        self.listData?.append(toilet)
                    }
                    
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                }
        }*/
    }
}