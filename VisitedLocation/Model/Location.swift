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
    var latitude: Double
    var longitude: Double
    var clLocation: CLLocation
    var visit: CLVisit
    var annotation: MKAnnotation
    
    // create CLLocation from the coordinates of CLVisit
//    let clLocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
    
}
//override var coordinate: CLLocationCoordinate2D {
//    return myCoordinates
//}

//static let geoCoder = CLGeocoder()
//// Get location description
//AppDelegate.geoCoder.reverseGeocodeLocation(clLocation) { placemarks, _ in
//    if let place = placemarks?.first {
//        let description = "\(place)"
//        self.newVisitReceived(visit, description: description)
//    }
//}
//
//func annotationForLocation(_ location: Location) -> MKAnnotation {
//    let annotation = MKPointAnnotation()
//    annotation.title = location.dateString
//    annotation.coordinate = location.coordinates
//    return annotation
//}
//
//mapView.userTrackingMode = .follow
//let annotations = LocationsStorage.shared.locations.map { annotationForLocation($0) }
//mapView.addAnnotations(annotations)
//NotificationCenter.default.addObserver(self, se
