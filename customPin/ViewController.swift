//
//  ViewController.swift
//  customPin
//
//  Created by Yash Patel on 14/11/17.
//  Copyright © 2017 Yash Patel. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var pin:AnnotationPin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
//        mapView.mapType = .satellite
        
        let coordinate = CLLocationCoordinate2D(latitude: 27.173891, longitude: 78.042068)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        
        mapView.setRegion(region, animated: true)
        
        pin = AnnotationPin(title: "Taj Mahal", Subtitle: "One of the wonder of the world", coordinate: coordinate)
        mapView.addAnnotation(pin)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "tajPin")
        annotationView.image = UIImage(named: "taj-mahal")
        let transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        annotationView.transform = transform
        return annotationView
    }
}

