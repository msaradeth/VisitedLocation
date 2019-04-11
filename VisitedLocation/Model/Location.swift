//
//  Location.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/10/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import RealmSwift


class Location: Object {
    @objc dynamic var latitude: Double = 0
    @objc dynamic var longitude: Double = 0
    @objc dynamic var name: String = ""
    @objc dynamic var address: String = ""

    
    convenience init(latitude: Double, longitude: Double, name: String, address: String) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
        self.name = name
        self.address = address
    }
    
    convenience init(coordinate: CLLocationCoordinate2D, name: String, address: String) {
        self.init()
        self.latitude = coordinate.latitude
        self.longitude = coordinate.longitude
        self.name = name
        self.address = address
    }

}


// MARK: helper methods
extension Location {
    
    func getAnnotation() -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = name
        annotation.subtitle = address        
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.coordinate = coordinate
        return annotation
    }
    
    func saveToDisk() {
        Storage.write(location: self)
    }
}
 


