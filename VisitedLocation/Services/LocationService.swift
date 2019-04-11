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

    override init() {
        self.locations = []
        subject = BehaviorSubject<[Location]>(value: locations)
        super.init()
        setup()
        
        //Get stored locations from disk
        Storage.shared.getStoredLocations { [weak self] (storeLocations) in
            guard let self = self else { return }
            self.locations.append(contentsOf: storeLocations)
            self.subject.onNext(self.locations)
        }
    }
    
    public func setup() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringVisits()
        locationManager.allowsBackgroundLocationUpdates = true        
    }
}


extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        let cllocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)
        geocoder.reverseGeocodeLocation(cllocation) { [weak self] (placemarks, error) in
            guard let self = self, let placemark = placemarks?.first else { return }
            let name = placemark.name ?? "Unknown"
            let location = Location(coordinate: visit.coordinate, name: name, address: placemark.addressString())
            location.saveToDisk()
            self.locations.append(location)            
            self.subject.onNext(self.locations)            
        }
    }    
}
