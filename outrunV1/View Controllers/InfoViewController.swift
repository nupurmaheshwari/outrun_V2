//
//  InfoViewController.swift
//  outrunV1
//
//  Created by Nupur Maheshwari on 12/5/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var load_1: UIImage!
    var load_2: UIImage!
    var load_3: UIImage!
    var load_4: UIImage!
    var load_5: UIImage!
    var load_6: UIImage!
    
    var images: [UIImage]!
    
    var animated_image: UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        load_1 = UIImage(named: "2")
        load_2 = UIImage(named: "3")
        load_3 = UIImage(named: "4")
        load_4 = UIImage(named: "5")
        load_5 = UIImage(named: "6")
        load_6 = UIImage(named: "7")
        
        images = [load_1, load_2, load_3, load_4, load_5, load_6]
        
        animated_image = UIImage.animatedImage(with: images, duration: 15.0)

        self.imageView.image = animated_image
    }

}
