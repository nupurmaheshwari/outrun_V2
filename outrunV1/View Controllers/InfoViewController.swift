//
//  InfoViewController.swift
//  outrunV1
//
//  Created by Nupur Maheshwari on 12/5/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var tapCount = 0
    
    @IBOutlet weak var outrun1: UILabel!
    @IBOutlet weak var outrun2: UILabel!
    @IBOutlet weak var outrun3: UILabel!
    @IBOutlet weak var outrun4: UILabel!
    @IBOutlet weak var outrun5: UILabel!
    @IBOutlet weak var outrun6: UILabel!
    @IBOutlet weak var outrun7: UILabel!
    @IBOutlet weak var zombieImage: UIImageView!
    @IBOutlet weak var firstAidImage: UIImageView!
    
    @IBAction func touchPlus(_ sender: UIButton) {
        if tapCount < 5 {
            tapCount += 1
        }
        tapCountStuff()
    }
    
    @IBAction func touchMinus(_ sender: UIButton) {
        if tapCount > 0 {
            tapCount -= 1
        }
        tapCountStuff()
    }
    
    func tapCountStuff() {
        if tapCount == 0 {
            outrun1.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun2.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            outrun3.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            outrun4.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            zombieImage.isHidden = true
            outrun5.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            firstAidImage.isHidden = true
            outrun6.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            outrun7.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
        }
        else if tapCount == 1 {
            outrun1.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun2.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun3.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            outrun4.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            zombieImage.isHidden = true
            outrun5.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            firstAidImage.isHidden = true
            outrun6.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            outrun7.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
        }
        else if tapCount == 2 {
            outrun1.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun2.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun3.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun4.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            zombieImage.isHidden = true
            outrun5.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            firstAidImage.isHidden = true
            outrun6.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            outrun7.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
        }
        else if tapCount == 3 {
            outrun1.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun2.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun3.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun4.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            zombieImage.isHidden = false
            outrun5.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            firstAidImage.isHidden = true
            outrun6.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            outrun7.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
        }
        else if tapCount == 4 {
            outrun1.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun2.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun3.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun4.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            zombieImage.isHidden = false
            outrun5.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            firstAidImage.isHidden = false
            outrun6.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
            outrun7.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0)
        }
        else if tapCount == 5 {
            outrun1.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun2.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun3.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun4.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            zombieImage.isHidden = false
            outrun5.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            firstAidImage.isHidden = false
            outrun6.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
            outrun7.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tapCountStuff()
    }

}



//    var load_1: UIImage!
//    var load_2: UIImage!
//    var load_3: UIImage!
//    var load_4: UIImage!
//    var load_5: UIImage!
//    var load_6: UIImage!
//
//    var images: [UIImage]!
//
//    var animated_image: UIImage!
//
//        load_1 = UIImage(named: "2")
//        load_2 = UIImage(named: "3")
//        load_3 = UIImage(named: "4")
//        load_4 = UIImage(named: "5")
//        load_5 = UIImage(named: "6")
//        load_6 = UIImage(named: "7")
//
//        images = [load_1, load_2, load_3, load_4, load_5, load_6]
//
//        animated_image = UIImage.animatedImage(with: images, duration: 15.0)
//
//        self.imageView.image = animated_image
