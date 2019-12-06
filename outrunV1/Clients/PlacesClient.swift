//
//  PlacesClient.swift
//  outrunV1
//
//  Created by Mohona Sengupta on 12/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import Foundation

class placesClient {
  func fetchPlaces(_ apicall: String, _ completion: @escaping ([Result]?) -> Void) {

    let urlString = URL(string: apicall)!

    let task0 = URLSession.shared.dataTask(with: urlString, completionHandler: { data, response, error in

        guard let data = data else { return }
        do {
            guard let welcome = try? JSONDecoder().decode(Welcome.self, from: data) else {
                print("Error: Couldn't decode data into a result")
                return
            }

            completion(welcome.results)

            }
      })
      task0.resume()
  }
}
