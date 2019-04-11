//
//  MapViewModel.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/10/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import RxSwift

class MapViewModel: NSObject {
    var locationService: LocationService
    var testLocation: TestLocation
     
    init(locationService: LocationService) {
        self.locationService = locationService
        self.testLocation = TestLocation(locationService: locationService)
    }
    
    
    func testLocationUpdate() {
        testLocation.resetTest()
        testLocation.runTest()
    }
    
    func stopTestLocationUpdate() {
        testLocation.stopTest()
    }
    
    
}




