//
//  getPatients().swift
//  Fern
//
//  Created by Travis Negron on 5/19/18.
//  Copyright © 2018 Travis Negron, Inc. All rights reserved.
//

import UIKit

public class getPatients {
    private var incidentNum: Int
    private var key: Int
    private var token: String
    
    public init(incidentNum: Int, key: Int, token: String) {
        self.incidentNum = incidentNum
        self.key = key
        self.token = token
    }
    
    func getData() {
        print(incidentNum)
    }
    
}
