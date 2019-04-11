//
//  AppDelegate.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/10/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var locationService: LocationService!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Setup Location Service
        let locations = Location.getMockData()
        locationService = LocationService(locations: [])
        locationService.startMonitoringVisits()
        
        //setup app entry point
        let viewModel = MapViewModel(locationService: locationService)
        let vc = MapVC.createWith(title: "Visited", viewModel: viewModel)
        let rootNav = UINavigationController(rootViewController: vc)
        rootNav.navigationBar.prefersLargeTitles = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

