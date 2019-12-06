//
//  GameViewController.swift
//  outrunV1
//
//  Created by Mohona Sengupta on 12/4/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit
import CoreLocation


class GameViewController: UIViewController, ARSKViewDelegate {
    
    //route directions
    var directions = routesModel()
    
    //message label, timer lable, ar view
    @IBOutlet weak var mapMessage: UILabel!
    @IBOutlet weak var clock: UILabel!
    @IBOutlet weak var sceneView: ARSKView!
    
    //timer variables
    var startTime:NSDate = NSDate()
    var timer = Timer()
    
    //location variables
    let locationManager = CLLocationManager()
    var currentCoordinate: CLLocationCoordinate2D!
    var stepCounter = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ar scene
        
        // Set the view's delegate
        sceneView.delegate = self

        // Show statistics such as fps and node count
        //sceneView.showsFPS = true
        sceneView.showsNodeCount = true

        let scene = Scene(size: sceneView.bounds.size)
        scene.scaleMode = .resizeFill
        sceneView.presentScene(scene)
        
        //route directions
        
        print(directions , "in map view")
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
        
        //onscreen timer
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(GameViewController.clockUp), userInfo: nil, repeats: true)

    }
    
    var elapsedTime: TimeInterval {
        return -1 * startTime.timeIntervalSinceNow
    }
    
    func getDirections() {
        self.locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })

        for i in directions.route[0].legs[0].steps {
            print(i.endLocation.lat, i.endLocation.lng)
            let coordinate2D = CLLocationCoordinate2D(latitude: i.endLocation.lat, longitude: i.endLocation.lng)
            let region = CLCircularRegion(center: coordinate2D, radius: 0.5, identifier: "\(i)")
            self.locationManager.startMonitoring(for: region)
        }

        var initialMessage = directions.route[0].legs[0].steps[0].htmlInstructions
        print("\nthis is the initial message", initialMessage)
        initialMessage = initialMessage.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
        stepCounter = 1
        self.mapMessage.text = initialMessage.lowercased()
    }
    
    @objc func clockUp() {
        let diffMin = Int(elapsedTime / 60)
        let diffSec = Float(elapsedTime.truncatingRemainder(dividingBy: 60))
        var time: String = String(format: "%02d:%04.1f", diffMin, diffSec)
        clock.text = time
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      // Create a session configuration
      let configuration = ARWorldTrackingConfiguration()

      // Run the view's session
      sceneView.session.run(configuration)
    }
    
    func randomInt(min: Int, max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        let zombieOrBox = randomInt(min: 1, max: 2)
        if zombieOrBox == 1 {
            let node = SKSpriteNode(imageNamed: "zombie1")
            node.name = "zombie"
            return node
        }
        else {
            let node = SKSpriteNode(imageNamed: "firstaidkit")
            node.name = "box"
            return node
        }
    }
}


extension GameViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.getDirections()
        manager.stopUpdatingLocation()
        guard let currentLocation = locations.first else { return }
        currentCoordinate = currentLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion)
    {
        print("___________________")
        print(stepCounter)
        if stepCounter < directions.route[0].legs[0].steps.count {
            var currentStep = directions.route[0].legs[0].steps[stepCounter].htmlInstructions
            let distToPoint = "In " + directions.route[0].legs[0].steps[stepCounter].distance.text
            currentStep = currentStep.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
            currentStep = currentStep.lowercased()
            mapMessage.text = ""
            mapMessage.text = distToPoint + " " + currentStep
            stepCounter += 1
        }
        else {
            mapMessage.text = "Arrived at destination"
            stepCounter = 0
            locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })
            
        }
    }
}
