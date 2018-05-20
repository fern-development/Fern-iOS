//
//  incidentManagementView.swift
//  Fern
//
//  Created by Travis Negron on 5/14/18.
//  Copyright © 2018 Travis Negron, Inc. All rights reserved.
//

import UIKit
import MapKit

class incidentManagementView: UIViewController {

    @IBOutlet var locationMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        locationMapView.clipsToBounds = true;
        locationMapView.layer.cornerRadius = 5;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
