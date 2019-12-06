//
//  SummaryViewController.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//


import UIKit
import Foundation
import GoogleMaps

class SummaryViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    
    var directions = routesModel()
    
    @IBOutlet weak var greenFlood: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var severityLabel: UILabel!
    
    override func viewDidLoad() {
        
        greenFlood.layer.cornerRadius = 10
        mapView.layer.cornerRadius = 10
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        distanceLabel.text = ""
        timeLabel.text = ""
        
        while directions.route.count == 0 {
            distanceLabel.text = "loading"
            timeLabel.text = "loading"
        }
        distanceLabel.text = directions.route[0].legs[0].distance.text
        timeLabel.text = directions.route[0].legs[0].duration.text
        severityLabel.text = directions.currentSeverity
        drawRoute()
    }
    
    func drawRoute() {
        let path = GMSMutablePath()
        
        for i in directions.route[0].legs[0].steps {
            path.add(CLLocationCoordinate2D(latitude: i.startLocation.lat, longitude: i.startLocation.lng))
            path.add(CLLocationCoordinate2D(latitude: i.endLocation.lat, longitude: i.endLocation.lng))
            print(i.htmlInstructions)
        }
        
        
        let rectangle = GMSPolyline(path: path)
        rectangle.spans = [GMSStyleSpan(color: .red)]
        rectangle.strokeWidth = 3.5
        rectangle.map = mapView
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        if segue.destination is MapViewController
//        {
//            let sumVC = segue.destination as? MapViewController
//            sumVC?.directions = directions
//        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is GameViewController
        {
            let sumVC = segue.destination as? GameViewController
            sumVC?.directions = directions
        }
    }
    
}


// MARK: - CLLocationManagerDelegate
extension SummaryViewController: CLLocationManagerDelegate {

  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    guard status == .authorizedWhenInUse else {
      return
    }
    locationManager.startUpdatingLocation()
      
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }
      
    mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)

    locationManager.stopUpdatingLocation()
  }
}

