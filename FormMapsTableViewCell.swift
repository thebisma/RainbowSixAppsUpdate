//
//  FormMapsTableViewCell.swift
//  
//
//  Created by bisma on 5/22/17.
//
//

import UIKit

class FormMapsTableViewCell: UITableViewCell {
  
    @IBOutlet weak var mapImage: UIImageView!
    
    @IBOutlet weak var mapLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
