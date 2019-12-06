//
//  RoutesModel.swift
//  outrunV1
//
//  Created by Mohona Sengupta on 12/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import Foundation


class routesModel {
    
    var currentSeverity = "hard"
    var otherSeverity = "easy"
    
    var route = [Route]()
 
    let client = routesClient()

    func refresh(_ url:String, _ completion: @escaping () -> Void) {
      client.fetchRoute(url) { [unowned self] data in
        if let data = data {
          self.route = data
        }
        completion()
      }
    }

}
