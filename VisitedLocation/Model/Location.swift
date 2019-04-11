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
    
    static func getAnnotation(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = "address"
        annotation.coordinate = coordinate
        return annotation
    }
    
    

    static func getMockData() -> [Location] {
        let loc1 = Location.getLocation(lat: 33.692610, long: -117.770650, title: "My house", subtitle: "Address")
        let loc2 = Location.getLocation(lat: 33.831249, long: -117.919678, title: "Anaheim Libray", subtitle: "Address")
        let loc3 = Location.getLocation(lat: 33.699680, long: -117.777450, title: "Heritage Park", subtitle: "Address")
        let locations = [loc1, loc2, loc3]
        return locations
    }
    
    static func getLocation(lat: Double, long: Double, title: String, subtitle: String) -> Location {
        let cllocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let location = Location(coordinate: cllocation, title: title, subtitle: subtitle)
        return location
    }
}



