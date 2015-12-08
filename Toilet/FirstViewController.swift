//
//  FirstViewController.swift
//  Toilet
//
//  Created by William JEHANNE on 08/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {
    
    @IBOutlet var myMapView: MKMapView!
    var listToilets:[Toilet]? = []


    override func viewDidLoad() {
        super.viewDidLoad()
                
        let initialLocation = CLLocation(latitude: 49.86006901848982, longitude: 3.2980109836676803)
        centerMapOnLocation(initialLocation)
        // Do any additional setup after loading the view, typically from a nib.
    
        if(ToiletSingleton.instance.toilet.count>0){
            self.myMapView.addAnnotations(ToiletSingleton.instance.toilet)

        }
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        myMapView.setRegion(coordinateRegion, animated: true)
    }
}

