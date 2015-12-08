//
//  FirstViewController.swift
//  Toilet
//
//  Created by William JEHANNE on 08/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import MapKit

class FirstViewController: UIViewController {
    
    @IBOutlet var myMapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestApi()
        
        let initialLocation = CLLocation(latitude: 49.86006901848982, longitude: 3.2980109836676803)
        centerMapOnLocation(initialLocation)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        myMapView.setRegion(coordinateRegion, animated: true)
    }
    
    func requestApi() {
        Alamofire.request(.GET, "http://scenies.com/insset_api/resources/toilets.json")
            .responseJSON { response in
                
                switch response.result {
                case .Success(let data):
                    let json = JSON(data)
                    
                    for i in 0..<json.count {
                        let id:Int = json[i]["id"].intValue
                        let name:String = json[i]["name"].stringValue
                        let longitude:Double = json[i]["coordinates"]["longitude"].doubleValue
                        let latitude:Double = json[i]["coordinates"]["latitude"].doubleValue
                        
                        let initialLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                        
                        let toilet = Toilet(id: id, title: name, coordinate: initialLocation)
                        self.myMapView.addAnnotation(toilet)
                        print("::::::::::::::::::::::::::::::::: \(toilet.title)")
                    }
                    
            
                case .Failure(let error):
                    print("Request failed with error: \(error)")
                }
                
        }
         }


}

