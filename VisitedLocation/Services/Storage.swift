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
    static public let realm = try! Realm()

    static func write(location: Location) {
        try! Storage.realm.write {
            Storage.realm.add(location)
        }
    }
    
    static func getStoredLocations(completion: @escaping ([Location]) -> Void) {
        var locations: [Location] = []
        DispatchQueue.main.async {
            let objects = Storage.realm.objects(Location.self)
            locations = Array(objects.map({ $0 }))
            completion(locations)
        }
    }
    
    
    static func deleteAll() {
        try! Storage.realm.write {
            Storage.realm.deleteAll()
        }
    }
}
