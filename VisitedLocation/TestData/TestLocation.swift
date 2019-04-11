//
//  TestLocation.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/11/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

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
        locations.append(mockLocations[index])
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
        let loc1 = Location.getLocation(lat: 33.692610, long: -117.770650, title: "99 Ranch Market", subtitle: "5402 Walnut Ave, Irvine, CA 92604")
        let loc2 = Location.getLocation(lat: 33.699680, long: -117.777450, title: "Heritage Park", subtitle: "14301 Yale Ave. Irvine, CA 92604")
        let loc3 = Location.getLocation(lat: 33.677898, long: -117.862373, title: "Johnwayne Airport", subtitle: "18601 Airport Way, Santa Ana, CA 92707")
        let loc4 = Location.getLocation(lat: 33.831249, long: -117.919678, title: "Anaheim Libray", subtitle: "500 W Broadway, Anaheim, CA 92805")
        let locations = [loc1, loc2, loc3, loc4]
        return locations
    }
}
