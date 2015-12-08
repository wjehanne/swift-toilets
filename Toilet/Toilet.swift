//
//  Toilet.swift
//  Toilet
//
//  Created by William JEHANNE on 08/12/2015.
//  Copyright © 2015 William JEHANNE. All rights reserved.
//

import Foundation
import MapKit

class Toilet : NSObject, MKAnnotation {
    var id:Int!
    var title:String!
    var coordinate:CLLocationCoordinate2D
    
    init(id:Int, title:String, coordinate:CLLocationCoordinate2D) {
        self.id = id
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
}
