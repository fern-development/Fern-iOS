//
//  ptHxTableViewCell.swift
//  Fern
//
//  Created by Travis Negron on 5/19/18.
//  Copyright © 2018 Travis Negron, Inc. All rights reserved.
//

import UIKit

class ptHxTableViewCell: UITableViewCell {

    @IBOutlet weak var ptHxCell: UIView!
    @IBOutlet weak var vitalsPanel_1: UIView!
    @IBOutlet weak var vitalsPanel_2: UIView!
    @IBOutlet weak var timeSinceAssessment: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
