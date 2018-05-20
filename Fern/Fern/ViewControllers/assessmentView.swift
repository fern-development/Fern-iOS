//
//  assessmentView.swift
//  Fern
//
//  Created by Travis Negron on 5/14/18.
//  Copyright © 2018 Travis Negron, Inc. All rights reserved.
//

import UIKit

class assessmentView: UIViewController {

    @IBOutlet weak var dkgrnBPView: UIView!
    @IBOutlet weak var dkgrnPulseView: UIView!
    @IBOutlet var dkgrnRespView: UIView!
    @IBOutlet var dkgrnSPO2COView: UIView!
    @IBOutlet var dkgrnSkinView: UIView!
    @IBOutlet var dkgrnTempView: UIView!
    
    @IBOutlet weak var assessToolBar: UIToolbar!
    @IBOutlet weak var saveToolBarBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dkgrnBPView.clipsToBounds = true;
        dkgrnBPView.layer.cornerRadius = 5;
        
        dkgrnPulseView.clipsToBounds = true;
        dkgrnPulseView.layer.cornerRadius = 5;
        
        dkgrnRespView.clipsToBounds = true;
        dkgrnRespView.layer.cornerRadius = 5;
        
        dkgrnSPO2COView.clipsToBounds = true;
        dkgrnSPO2COView.layer.cornerRadius = 5;
        
        dkgrnSkinView.clipsToBounds = true;
        dkgrnSkinView.layer.cornerRadius = 5;
        
        dkgrnTempView.clipsToBounds = true;
        dkgrnTempView.layer.cornerRadius = 5;
        
        assessToolBar.clipsToBounds = true;
        assessToolBar.layer.cornerRadius = 20;

        // Do any additional setup after loading the view.
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
