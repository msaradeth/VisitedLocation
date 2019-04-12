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
        let address = concatenate(string1: self.subThoroughfare, string2: self.thoroughfare) + "\n"    //Street number and street name
            +  addPuntuationIfNotNil(string1: self.locality, puntuation: ", ")             // City
            +  addPuntuationIfNotNil(string1: self.administrativeArea, puntuation: ". ")    //State
            +  addPuntuationIfNotNil(string1: self.postalCode, puntuation: "\n")            //Zip
            + (self.country ?? "")  //Country
        
        return address
    }
    
    func addPuntuationIfNotNil(string1: String?, puntuation: String) -> String {
        guard let result = string1, result.count > 0 else { return "" }
        return result + puntuation
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

