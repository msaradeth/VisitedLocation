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



class LocationService: NSObject {
    let locationManager = CLLocationManager()
    

    override init() {
        super.init()
        
        locationManager.requestAlwaysAuthorization()
        locationManager.stopMonitoringVisits()        
        locationManager.delegate = self
    }
}

extension LocationService: CLLocationManagerDelegate {
    
}

//static let geoCoder = CLGeocoder()
//let center = UNUserNotificationCenter.current()
//let locationManager = CLLocationManager()
