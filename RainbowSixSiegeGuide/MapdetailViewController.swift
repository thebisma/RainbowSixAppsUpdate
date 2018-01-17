//
//  MapdetailViewController.swift
//  RainbowSixSiegeGuide
//
//  Created by bisma on 6/1/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit

class MapdetailViewController: UIViewController {
    
    
    @IBOutlet weak var Maps: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    Maps.image = UIImage(named:imagedetail[myIndex])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
