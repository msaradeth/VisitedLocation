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
        
    }
    
    func setupVC() {
        
        viewModel.subject.asObservable()
            .subscribe(onNext: { [weak self] items in
                guard let self = self else { return }
                self.mapView.addAnnotations(items.map({ $0.annotation }))
            })
            .disposed(by: disposeBag)
    }
 
    
}
