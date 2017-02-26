//
//  BusinessMapViewController.swift
//  Yelp
//
//  Created by john on 2/26/17.
//  Copyright © 2017 CoderSchool. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class BusinessMapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager : CLLocationManager!
    
    var selectedBusiness: Business?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self

        // Do any additional setup after loading the view.
        let centerLocation = CLLocation(latitude: (selectedBusiness?.latitude)!, longitude: (selectedBusiness?.longitude)!)
        goToLocation(location: centerLocation)
        
        // draw circular overlay centered in San Francisco
        let circleOverlay: MKCircle = MKCircle(center: centerLocation.coordinate, radius: 1000)
        mapView.addOverlays([circleOverlay])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
        addAnnotationAtCoordinate(coordinate: location.coordinate)
    }
    
    // add an Annotation with a coordinate: CLLocationCoordinate2D
    func addAnnotationAtCoordinate(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = selectedBusiness?.name
        mapView.addAnnotation(annotation)
        mapView.selectAnnotation(annotation, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleView = MKCircleRenderer(overlay: overlay)
        circleView.strokeColor = UIColor.red
        circleView.lineWidth = 1
        return circleView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
