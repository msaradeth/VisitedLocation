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
    var subject: BehaviorSubject<[Location]>
    
    init(items: [Location]) {
        subject = BehaviorSubject<[Location]>(value: items)
    }
}
