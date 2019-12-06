//
//  PlacesModel.swift
//  outrunV1
//
//  Created by Mohona Sengupta on 12/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import Foundation

class routeBuilder {
    
    let client = placesClient()

    var results = [Result]()
    var chosenHalfPoint = [Result]()
    var chosenRoute = routesModel()
    
    func refresh(_ url:String, _ completion: @escaping () -> Void) {
      client.fetchPlaces(url) { [unowned self] data in
        if let data = data {
          self.results = data
        }
        completion()
      }
    }

}
