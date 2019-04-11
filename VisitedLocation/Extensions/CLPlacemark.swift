//
//  CLPlacemark.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/11/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//
import CoreLocation

import Foundation

extension CLPlacemark {
    func addressString() -> String {
        let address = concatenate(string1: self.thoroughfare, string2: self.subThoroughfare)  //Street address
            + " " + concatenate(string1: self.locality, string2: self.subLocality)   //City
            + " " + concatenate(string1: self.administrativeArea, string2: self.subAdministrativeArea)   //State
            + " " + (self.postalCode ?? "")   //Zip
            + " " + (self.country ?? "")  //Country
        
        return address
    }
        
    func concatenate(string1: String?, string2: String?) -> String {
        var result = ""
        if let string1 = string1 {
            result = string1
        }
        if let string2 = string2 {
            result = result + " " + string2
        }        
        return result
    }
}
