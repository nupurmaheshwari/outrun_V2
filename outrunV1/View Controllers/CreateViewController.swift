//
//  CreateViewController.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class CreateViewController: UIViewController, CLLocationManagerDelegate{
    
//    let route = Route()
    
    var userRadius = 0.0
    let userRouteModel = routeBuilder()
    
    let locationManager = CLLocationManager()
    var userCurrentLat = 0.0
    var userCurrentLong = 0.0
//    var chosenDirections : [String:[String]] = [:]
    
    
    @IBOutlet weak var labelDistance: UILabel!
    @IBOutlet weak var halfMileButton: UIButton!
    @IBOutlet weak var oneMileButton: UIButton!
    @IBOutlet weak var mileHalfButton: UIButton!
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var fiveMinuteButton: UIButton!
    @IBOutlet weak var tenMinuteButton: UIButton!
    @IBOutlet weak var fifteenMinuteButton: UIButton!
    
    @IBAction func fiveMinutesPressed(_ sender: Any) {
        userRadius = 400

        //change button to reflect click
        fiveMinuteButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        fiveMinuteButton.setTitleColor(UIColor.black, for: .normal)


        // Set other button's background color.
        tenMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black

        // Set other button's title color.
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)


        //set distance buttons
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        halfMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        oneMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        mileHalfButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    }
    
    @IBAction func tenMinutesPressed(_ sender: Any) {
        userRadius = 800

        //change button to reflect click
        tenMinuteButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        tenMinuteButton.setTitleColor(UIColor.black, for: .normal)


        // Set other button's background color.
        fiveMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black

        // Set other button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)


        //set distance buttons
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        halfMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        oneMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        mileHalfButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    }
    
    @IBAction func fifteenMinutesPressed(_ sender: Any) {
        userRadius = 1600

        //change button to reflect click
        fifteenMinuteButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        fifteenMinuteButton.setTitleColor(UIColor.black, for: .normal)


        // Set other button's background color.
        fiveMinuteButton.backgroundColor = UIColor.black
        tenMinuteButton.backgroundColor = UIColor.black

        // Set other button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)


        //set distance buttons
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        halfMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        oneMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        mileHalfButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
    }
    
    @IBAction func halfMilePressed(_ sender: Any) {
        userRadius = 1609.34
        
        //change button to reflect click
        halfMileButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        halfMileButton.setTitleColor(UIColor.black, for: .normal)

        // Set other button's background color.
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black

        // Set other button's title color.
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        
        //set distance buttons
        fiveMinuteButton.backgroundColor = UIColor.black
        tenMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        fiveMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        tenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        fifteenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
    }
    
    @IBAction func oneMilePressed(_ sender: Any) {
        userRadius = 4828.03
        
        //change button to reflect click
        oneMileButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        oneMileButton.setTitleColor(UIColor.black, for: .normal)
        
        // Set other button's background color.
        halfMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        
        // Set other button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        
        //set distance buttons
        fiveMinuteButton.backgroundColor = UIColor.black
        tenMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        fiveMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        tenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        fifteenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
    }
    
    @IBAction func mileHalfPressed(_ sender: Any) {
        userRadius = 8046.72

        //change button to reflect click
        mileHalfButton.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8)
        mileHalfButton.setTitleColor(UIColor.black, for: .normal)

        // Set other button's background color.
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black

        // Set other button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        
        //set distance buttons
        fiveMinuteButton.backgroundColor = UIColor.black
        tenMinuteButton.backgroundColor = UIColor.black
        fifteenMinuteButton.backgroundColor = UIColor.black
        // Set distance button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        // Set distance button's border color.
        fiveMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        tenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        fifteenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor

        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
    }
    
    @IBAction func createWorkout(_ sender: Any) {
        routeCreation()
    }

    @IBAction func severityToggled(_ sender: Any) {
        if userRouteModel.chosenRoute.currentSeverity == "hard" && userRouteModel.chosenRoute.otherSeverity == "easy" {
            userRouteModel.chosenRoute.currentSeverity = "easy"
            userRouteModel.chosenRoute.otherSeverity = "hard"
        }
        else {
            userRouteModel.chosenRoute.currentSeverity = "hard"
            userRouteModel.chosenRoute.otherSeverity = "easy"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        // Set time button's title color.
        fiveMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        tenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        fifteenMinuteButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8), for: .normal)
        
        // Set time button's corner radius.
        fiveMinuteButton.layer.cornerRadius = 30
        tenMinuteButton.layer.cornerRadius = 30
        fifteenMinuteButton.layer.cornerRadius = 30
        
        // Set time button's border width.
        fiveMinuteButton.layer.borderWidth = 1
        tenMinuteButton.layer.borderWidth = 1
        fifteenMinuteButton.layer.borderWidth = 1
        
        // Set time button's border color.
        fiveMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8).cgColor
        tenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8).cgColor
        fifteenMinuteButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.8).cgColor
        
        labelTime.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        
        // Set distance button's background color.
        halfMileButton.backgroundColor = UIColor.black
        oneMileButton.backgroundColor = UIColor.black
        mileHalfButton.backgroundColor = UIColor.black
        
        // Set distance button's title color.
        halfMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        oneMileButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileHalfButton.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        
        // Set distance button's corner radius.
        halfMileButton.layer.cornerRadius = 30
        oneMileButton.layer.cornerRadius = 30
        mileHalfButton.layer.cornerRadius = 30
        
        // Set distance button's border width.
        halfMileButton.layer.borderWidth = 1
        oneMileButton.layer.borderWidth = 1
        mileHalfButton.layer.borderWidth = 1
        
        // Set distance button's border color.
        halfMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        oneMileButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        mileHalfButton.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        
        labelDistance.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.25)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        userCurrentLat = locValue.latitude
        userCurrentLong = locValue.longitude
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    func routeCreation() {
        
        let first = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + String(userCurrentLat) + ","
        let second = String(userCurrentLong) + "&radius="
        let third = String(userRadius/2) + "&key=AIzaSyD2sEnjE9LViaXMgvguCboMgDiaml1wdVY"
        let api = first + second + third
        
        userRouteModel.refresh(api) { [unowned userRouteModel] in
            DispatchQueue.global(qos: .userInitiated).async {
                let randNumber = Int.random(in: 0 ..< userRouteModel.results.count)
                
                userRouteModel.chosenHalfPoint = [userRouteModel.results[randNumber]]
                
                let first = "https://maps.googleapis.com/maps/api/directions/json?origin="  + String(40.445550) + "," + String(-79.942620)
                let second = "&destination=" + String(userRouteModel.chosenHalfPoint[0].geometry.location.lat) + "," + String(userRouteModel.chosenHalfPoint[0].geometry.location.lng)
                let third  = "&avoid=highways&mode=walking&key=AIzaSyD2sEnjE9LViaXMgvguCboMgDiaml1wdVY"

                let api2 = (first + second + third)

                userRouteModel.chosenRoute.refresh(api2) {[unowned userRouteModel] in
                    DispatchQueue.main.async {
                        print(userRouteModel.chosenRoute.route)
                    }

                }
                
            }
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is SummaryViewController
        {
            let sumVC = segue.destination as? SummaryViewController
            sumVC?.directions = userRouteModel.chosenRoute
        }
    }
    
}

