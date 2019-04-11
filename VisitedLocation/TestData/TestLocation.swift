//
//  TestLocation.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/11/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import CoreLocation

class TestLocation {
    private let mockLocations = TestLocation.getMockData()
    private var locations: [Location] = []
    private var index = 0
    private var locationService: LocationService
    private var testCompleted: Bool = false
    
    init(locationService: LocationService) {
        self.locationService = locationService
    }
    
    func runTest() {
        guard testCompleted == false, index < mockLocations.count else { return }
        let newLocation = mockLocations[index]
        newLocation.saveToDisk()
        locations.append(newLocation)
        locationService.subject.onNext(locations)
                
        
        //add more locations or reset data
        index += 1
        if index >= mockLocations.count {
            resetTest()
        }

        //Send new location every x seconds        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.runTest()
        }
    }
    
    func stopTest() {
        testCompleted = true
    }
    
    func resetTest()  {
        locations.removeAll()
        testCompleted = false
        index = 0
    }
    
    
    static func getMockData() -> [Location] {
        let loc1 = Location(latitude: 33.692610, longitude: -117.770650, name: "99 Ranch Market", address: "5402 Walnut Ave, Irvine, CA 92604")
        let loc2 = Location(latitude: 33.699680, longitude: -117.777450, name: "Heritage Park", address: "14301 Yale Ave. Irvine, CA 92604")
        let loc3 = Location(latitude: 33.677898, longitude: -117.862373, name: "Johnwayne Airport", address: "18601 Airport Way, Santa Ana, CA 92707")
        let loc4 = Location(latitude: 33.831249, longitude: -117.919678, name: "Anaheim Libray", address: "500 W Broadway, Anaheim, CA 92805")
        let locations = [loc1, loc2, loc3, loc4]
        return locations
    }
    
}
