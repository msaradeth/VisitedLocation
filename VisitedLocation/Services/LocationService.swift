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
import UserNotifications



class LocationService: NSObject {
    let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestToLogLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startMonitoringVisits()
        
    }

}

extension LocationService: CLLocationManagerDelegate {
    
}

//static let geoCoder = CLGeocoder()
//let center = UNUserNotificationCenter.current()
//let locationManager = CLLocationManager()
