//
//  Address.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/10/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import CoreLocation


struct Address {
    var name: String
    var address: String
    var city: String
    var state: String
    var zip: String
    var country: String
    
    var addressString: String {
        return name
            + "\n" + address
            + "\n" + city
            + " " + state
            + " " + zip
            + "\n" + country
    }
    
    init(placeMark: CLPlacemark) {
        self.name = placeMark.name ?? ""
        self.address = (placeMark.thoroughfare ?? "") + " "
            + (placeMark.subThoroughfare ?? "")
        self.city = (placeMark.locality ?? "") + " "
            + (placeMark.subLocality ?? "")
        self.state = (placeMark.administrativeArea ?? "") + " "
            + (placeMark.subAdministrativeArea ?? "")
        self.zip = placeMark.postalCode ?? ""
        self.country = placeMark.country ?? ""
    }
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
