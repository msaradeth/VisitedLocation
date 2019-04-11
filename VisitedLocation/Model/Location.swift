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

struct Location {
    var coordinate: CLLocationCoordinate2D
    var annotation: MKAnnotation
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.annotation = Location.getAnnotation(coordinate: coordinate, title: title, subtitle: subtitle)
    }
}


// MARK: helper methods
extension Location {
    static func getAnnotation(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subtitle
        annotation.coordinate = coordinate
        return annotation
    }
        
    static func getLocation(lat: Double, long: Double, title: String, subtitle: String) -> Location {
        let cllocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let location = Location(coordinate: cllocation, title: title, subtitle: subtitle)
        return location
    }
}
 


