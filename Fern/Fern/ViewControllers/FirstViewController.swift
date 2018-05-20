//
//  FirstViewController.swift
//  Fern
//
//  Created by Travis Negron on 5/13/18.
//  Copyright © 2018 Travis Negron, Inc. All rights reserved.
//

import UIKit

//0.4 alpha

// Allow for Rotated Labels
extension UILabel {
    @IBInspectable
    var rotation: Int {
        get {
            return 0
        } set {
            let radians = CGFloat(CGFloat(Double.pi) * CGFloat(newValue) / CGFloat(180.0))
            self.transform = CGAffineTransform(rotationAngle: radians)
        }
    }
}

// End Allow for Rotated Labels

class FirstViewController: UIViewController {
    
    @IBOutlet weak var ptTableView_searchBar: UISearchBar!
    @IBOutlet var ptTableView: UITableView!
    @IBOutlet weak var assessmentButton: UIButton!
    @IBOutlet weak var incidentManageButton: UIButton!
    @IBOutlet weak var refreshDataButton: UIButton!
    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var taskManagerTask: UIView!
    @IBOutlet weak var taskManagerSaveBtn: UIButton!
    @IBOutlet weak var databaseInfo: UIView!
    
    @IBOutlet weak var barcodeScanner: UIButton!
    
    @IBOutlet weak var bpView_New: UIView!
    @IBOutlet weak var pulseView_New: UIView!
    @IBOutlet weak var respView_New: UIView!
    @IBOutlet weak var saveBtn_New: UIButton!
    @IBOutlet weak var trashBtn_New: UIButton!
    @IBOutlet weak var pulseQuality_New: UILabel!
    @IBOutlet weak var bpMethod: UILabel!
    @IBOutlet weak var respQuality: UILabel!
    @IBOutlet weak var spo2_percent: UILabel!
    @IBOutlet weak var bpTextbox: UITextField!
    @IBOutlet weak var pulseTextbox: UITextField!
    @IBOutlet weak var respirationsTextbox: UITextField!
    @IBOutlet weak var spo2Textbox: UITextField!
    @IBOutlet weak var skinTextbox: UITextField!
    @IBOutlet weak var skinCondition: UILabel!
    
    
    @IBOutlet weak var logView: UIView!
    
    @IBOutlet weak var sampleRecent_1: UIView!
    @IBOutlet weak var sampleTime_1: UILabel!
    @IBOutlet weak var sampleRecent_2: UIView!
    @IBOutlet weak var sampleTime_2: UILabel!
    @IBOutlet weak var sampleBpLabel: UILabel!
    @IBOutlet weak var samplePulseLabel: UILabel!
    @IBOutlet weak var sampleRespLabel: UILabel!
    @IBOutlet weak var sampleSpo2Label: UILabel!
    @IBOutlet weak var sampleSkinLabel: UILabel!
    @IBOutlet weak var sampleTempLabel: UILabel!
    
    @IBOutlet weak var sampleVitalView_1: UIView!
    @IBOutlet weak var sampleVitalView_2: UIView!
    @IBOutlet weak var sampleVitalView_3: UIView!
    @IBOutlet weak var sampleVitalView_4: UIView!
    
    var patients = [Patient]()
    var assessments = [Assessment]()
    
    public var ptCellSelected = String()
    
    struct Patient: Decodable {
        
        let idAuto: Int?
        let incidentNum: String?
        let timeStamp: String?
        let patientIdentifier: String?
        let lastAssessed: String?
        let agencyIdentifier: String?
        let masterKey: Int?
    }
    
    struct Assessment: Decodable {
        
        let idAuto: Int?
        let incidentNum: String?
        let timeStamp: String?
        let patientIdentifier: String?
        let mentalStatus: String?
        let bloodPressureSys: Int?
        let bloodPressureDia: Int?
        let pulse: Int?
        let respirations: Int?
        let spo2: Int?
        let spco: Int?
        let skinCondition: String?
        let temperature: Int?
        let bottleCount: Int?
        let transport: String?
        let comments: String?
        let masterKey: Int?
        let recordStatus: String?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseInfo.clipsToBounds = true;
        databaseInfo.layer.cornerRadius = 3;
        
        incidentManageButton.clipsToBounds = true;
        incidentManageButton.layer.cornerRadius = 3;
        
        refreshDataButton.clipsToBounds = true;
        refreshDataButton.layer.cornerRadius = 3;
        
        connectButton.clipsToBounds = true;
        connectButton.layer.cornerRadius = 3;
        
        saveBtn_New.clipsToBounds = true;
        saveBtn_New.layer.cornerRadius = 3;
        
        pulseQuality_New.clipsToBounds = true;
        pulseQuality_New.layer.cornerRadius = 3;
        bpMethod.clipsToBounds = true;
        bpMethod.layer.cornerRadius = 3;
        respQuality.clipsToBounds = true;
        respQuality.layer.cornerRadius = 3;
        spo2_percent.clipsToBounds = true;
        spo2_percent.layer.cornerRadius = 3;
        skinCondition.clipsToBounds = true;
        skinCondition.layer.cornerRadius = 3;
        
        logView.clipsToBounds = true;
        logView.layer.cornerRadius = 3;
        
        //trashBtn_New.clipsToBounds = true;
        //trashBtn_New.layer.cornerRadius = 3;
        //trashBtn_New.layer.borderColor = UIColor(red:20.0/255, green:54.0/255, blue:80.0/255, alpha: 1.0).cgColor;
        //trashBtn_New.layer.borderWidth = 2.0;
        
        //taskManagerTask.clipsToBounds = true;
        //taskManagerTask.layer.cornerRadius = 2;
        //taskManagerTask.layer.borderColor = UIColor(red:189.0/255, green:195.0/255, blue:199.0/255, alpha: 1.0).cgColor;
        //taskManagerTask.layer.borderWidth = 2.0;
        
        //taskManagerSaveBtn.clipsToBounds = true;
        //taskManagerSaveBtn.layer.cornerRadius = 5;
        //taskManagerSaveBtn.layer.borderColor = UIColor(red:189.0/255, green:195.0/255, blue:199.0/255, alpha: 1.0).cgColor;
        //taskManagerSaveBtn.layer.borderWidth = 1.0;
        
        
        
        // Incident Loading Process: Load all the data retrieve for initial ignition; process: initiateStartup()
        //initiateStartup(incidentNum: 2018, key: 5380);
        
        
    }
    
    
    //Functions REQUIRED for Initiating of Application
    
    func initiateStartup(incidentNum: Int, key: Int) {
        createIncident(incidentNum: incidentNum, key: key);
        getPatients(incidentNum: incidentNum, key: key);
    }
    
    func createIncident(incidentNum: Int, key: Int) {
        
        print("Incident being created.. \(incidentNum)")
    }
    
    func getPatients(incidentNum: Int, key: Int) {
    
        let jsonUrlString = String("http://rest.api-nyc.fern.run/incident/\(incidentNum)/key/\(key)/patients");
        print("JSON Received: \(jsonUrlString)")
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // Check for ERROR
            
            // Check for 200 OK
            
            guard let data = data else { return }
            
            // let dataAsString = String(data: data, encoding: .utf8)
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase;
                self.patients = try decoder.decode([Patient].self, from: data)
                //self.ptTableView.reloadData();
            } catch let jsonError {
                
                print("Error serializing JSON:" , jsonError)
            }
            
            }.resume()
        
        getAssessments(incidentNum: 2018, key: 5380, patientIdentifier: "9813");
    }
    
    func getAssessments(incidentNum: Int, key: Int, patientIdentifier: String) {
        
        let jsonUrlString = String("http://rest.api-nyc.fern.run/incident/\(incidentNum)/key/\(key)/patient/\(patientIdentifier)/assessments");
        print("JSON Received: \(jsonUrlString)")
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            // Check for ERROR
            
            // Check for 200 OK
            
            guard let data = data else { return }
            
            let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString!)
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase;
                self.assessments = try decoder.decode([Assessment].self, from: data)
            } catch let jsonError {
                
                print("Error serializing JSON:" , jsonError)
            }
            
            }.resume()
    }
    
    //End Functions Required for Initiation of Application
    
    //JSON Class: Retrieve and Post Data to Node.js server
    func jsonDataRetriever(JSONString: String, restAPIToken: String, dataIdentifier: String) {
        
        guard let webURL = URL(string: JSONString) else { return }
        URLSession.shared.dataTask(with: webURL) { (data, response, err) in
            // Check for ERROR
            
            // Check for 200 OK
            
            guard let data = data else { return }
            
            let dataAsString = String(data: data, encoding: .utf8)
            print(dataAsString!)
            
            do {
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase;
                
                self.assessments = try decoder.decode([Assessment].self, from: data)
            } catch let jsonError {
                
                print("Error serializing JSON:" , jsonError)
            }
            
            }.resume()
    }
    
    func jsonDataPoster(JSONString: String, restAPIToken: Int, dataIdentifier: String) {
        
        
    }
    //End JSON Class
    
    //Barcode Scanner: Scan Barcodes for Accountability/Agency Specifc Identifiers
    
    @IBAction func activateBarcodeScanner(_ sender: Any) {
        print("Barcode Scanner (2OO OK): ACTIVATED")
    }
    
    
    //End Barcode Scanner
    
    
    @IBAction func refreshData(_ sender: Any) {
        initiateStartup(incidentNum: 2018, key: 5380);
        print("Data Refreshed; refreshdata()");
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAssessBtn(_ sender: Any) {
        
        let bloodPressure = String("\(bpTextbox.text!) Manual");
        let pulse = String("\(pulseTextbox.text!) Strong");
        let respirations = String(respirationsTextbox.text! + " Regular");
        let spo2 = String(spo2Textbox.text! + " %");
        
        print("Asessment (Patient: " + self.ptCellSelected + ")\n Blood Pressure: " + bloodPressure + "\n Pulse: " + pulse + "\n Respirations: " + respirations + "\n SPO2/SPCO: " + spo2);
    }
    
}
    
extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(patients.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! patientCell
        let patient = patients[indexPath.row]
        
        cell.blueBackgroundView.clipsToBounds = true;
        cell.blueBackgroundView.layer.cornerRadius = 3;
        //cell.blueBackgroundView.layer.borderColor = UIColor(red:20.0/255, green:54.0/255, blue:80.0/255, alpha: 1.0).cgColor;
        //cell.blueBackgroundView.layer.borderWidth = 1.0;
        
        cell.blueRadiusView.layer.borderColor = UIColor(red:20.0/255, green:54.0/255, blue:80.0/255, alpha: 1.0).cgColor;
        cell.blueRadiusView.layer.borderWidth = 1.0;
        
        cell.patientIdentLabel.clipsToBounds = true;
        cell.patientIdentLabel.layer.cornerRadius = 5;
        cell.patientIdentLabel.layer.borderColor = UIColor(red:192.0/255, green:57.0/255, blue:43.0/255, alpha: 1.0).cgColor;
        cell.patientIdentLabel.layer.borderWidth = 2.0;
        
        cell.gradientView.layer.borderColor = UIColor(red:192.0/255, green:57.0/255, blue:43.0/255, alpha: 1.0).cgColor;
        cell.gradientView.layer.borderWidth = 1.0;
        
        cell.agencyLabel.adjustsFontSizeToFitWidth = true; // UPDATE TO HAVE LABEL CHANGE WIDTH BASED ON TEXT
        
        cell.agencyLabel.text? = String(patient.agencyIdentifier!)
        cell.patientIdentLabel.text? = String(patient.patientIdentifier!)
        
        //let patient = patients[indexPath.row]
        //cell.textLabel?.text = patient.patient_identifier
        //cell.detailTextLabel?.text = String?(patient.incident_num! + " / " + patient.agency_identifier!)
        return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.ptCellSelected = String?(patients[indexPath.row].patientIdentifier!)!;
        let cellIndex = tableView.cellForRow(at: indexPath) as! patientCell
        
        cellIndex.agencyLabel.text = patients[indexPath.row].patientIdentifier;
    
        //typecell.blueBackgroundView.layer.cornerRadius = 3.0;
        //typecell.blueBackgroundView.layer.borderWidth = 2.0;
        cellIndex.blueRadiusView.layer.borderColor = UIColor(red:241/255, green:196/255, blue: 15/255, alpha: 1.0).cgColor;
        
        }
    
        
    }

