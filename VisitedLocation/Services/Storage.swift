//
//  StorageService.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/10/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import RealmSwift

class Storage: NSObject {
    static let shared = Storage()
    public let realm: Realm

    private override init() {
        realm = try! Realm()
    }
    
    func getStoredLocations(completion: @escaping ([Location]) -> Void) {
        var locations: [Location] = []
        DispatchQueue.main.async {
            let objects = self.realm.objects(Location.self)
            locations = Array(objects.map({ $0 }))
            completion(locations)
        }
    }    
}
