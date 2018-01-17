//
//  OPTableViewCell.swift
//  RainbowSixSiegeGuide
//
//  Created by bisma on 6/1/17.
//  Copyright © 2017 iosdev. All rights reserved.
//

import UIKit

class OPTableViewCell: UITableViewCell {

    @IBOutlet weak var myImages: UIImageView!
    @IBOutlet weak var myText: UILabel!
    
    
    @IBOutlet weak var myConstraint: NSLayoutConstraint!
    var isExpanded:Bool = false
    {
        didSet
        {
            if !isExpanded {
                self.myConstraint.constant = 0.0
                
            } else {
                self.myConstraint.constant = 221.0
            }
        }
    }


}
