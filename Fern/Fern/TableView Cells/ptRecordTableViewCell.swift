//
//  ptRecordTableViewCell.swift
//  Fern
//
//  Created by Travis Negron on 5/19/18.
//  Copyright © 2018 Travis Negron, Inc. All rights reserved.
//

import UIKit

class ptRecordTableViewCell: UITableViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var ptType_Label: UILabel!
    @IBOutlet weak var lastAssessmentTime_Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
