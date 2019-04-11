//
//  LocationService.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/10/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import RxSwift
import CoreLocation
import MapKit


class LocationService: NSObject {
    fileprivate let locationManager = CLLocationManager()
    fileprivate let geocoder = CLGeocoder()
    public var subject: BehaviorSubject<[Location]>
    var locations: [Location]

    init(locations: [Location]) {
        self.locations = locations
        print(locations)
        subject = BehaviorSubject<[Location]>(value: locations)
        
        super.init()
        locationManager.delegate = self
    }
    
    public func startMonitoringVisits() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringVisits()
//        locationManager.startUpdatingLocation()
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.delegate = self
    }

}

extension LocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        let cllocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
        geocoder.reverseGeocodeLocation(cllocation) { [weak self] (placemarks, error) in
            guard let self = self, let placemark = placemarks?.first else { return }            
            let description = "\(placemark)"
            let name = placemark.name ?? "Unknown"
            let location = Location(coordinate: visit.coordinate, title: name, subtitle: description)
            self.locations.append(location)
            self.subject.onNext(self.locations)
        }
    }
    
    
    
    //For testing only
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        print(location)
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let self = self, let placemark = placemarks?.first else { return }
            let description = "\(placemark)"
            let name = placemark.name ?? "Unknown"
            let location = Location(coordinate: location.coordinate, title: name, subtitle: description)
            self.locations.append(location)
            self.subject.onNext(self.locations)
        }
    }
    

}
