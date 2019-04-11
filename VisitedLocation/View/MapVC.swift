//
//  MapVC.swift
//  VisitedLocation
//
//  Created by Mike Saradeth on 4/10/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import UIKit
//import CoreLocation
import MapKit
import RxSwift
import RxCocoa


class MapVC: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var testButton: UIBarButtonItem!
    let identifier = "identifier"
    let disposeBag = DisposeBag()
    var viewModel: MapViewModel!
    
    static func createWith(title: String, viewModel: MapViewModel) -> MapVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        vc.title = title
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        setupRx()    
    }
    
    func setupVC() {
        mapView.delegate = self
    }
    func setupRx()  {
        viewModel.locationService.subject.asObservable()
            .subscribe(onNext: { [weak self] items in
                guard let self = self else { return }
                let annotations = items.map({ $0.getAnnotation() })
                self.mapView.showAnnotations(annotations, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func testLocationUpdate(_ sender: Any) {
        if testButton.title == "Start Test" {
            viewModel.testLocationUpdate()
            testButton.title = "Stop Test"
        }else {
            viewModel.stopTestLocationUpdate()
            testButton.title = "Start Test"
        }        
    }
}


extension MapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKPointAnnotation else { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        annotationView?.canShowCallout = true
        return annotationView
    }
}
