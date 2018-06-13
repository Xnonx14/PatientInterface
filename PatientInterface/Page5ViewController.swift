//
//  Page5ViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/21/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit
import MessageUI
class Page5ViewController: UIViewController, MFMailComposeViewControllerDelegate,UITextFieldDelegate {
    
    @IBOutlet weak var seg1: UISegmentedControl!
    @IBOutlet weak var seg2: UISegmentedControl!
    @IBOutlet weak var seg3: UISegmentedControl!
    @IBOutlet weak var seg4: UISegmentedControl!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var switch3: UISwitch!
    @IBOutlet weak var switch4: UISwitch!
    @IBOutlet weak var switch2: UISwitch!
    
    
    var combinedBody = ""
    var subject = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func Swiped(_ sender: UISwipeGestureRecognizer) {
        GeneralViewController.changeView(sender.direction.rawValue)
        
    }
    @IBAction func sendEmailButtonTapped(_ sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    func textFieldShouldReturn(_ textField: UITextField)->Bool {
        self.view.endEditing(true);
        return false;
    }
    @IBAction func clearAll(_ sender: UIButton) {
        seg1.selectedSegmentIndex = 0
        seg2.selectedSegmentIndex = 0
        seg3.selectedSegmentIndex = 0
        seg4.selectedSegmentIndex = 0
        switch1.isOn = true
        switch2.isOn = true
        tfName.text = ""
    }
    func createBody(){
        subject = seg1.titleForSegment(at: seg1.selectedSegmentIndex)!
        let p1:String = seg2.titleForSegment(at: seg2.selectedSegmentIndex)!
        var p2:String = seg3.titleForSegment(at: seg3.selectedSegmentIndex)!
        if(p2 == "AA"){
            p2 = "Aortic Aneurysm"
        }
        let p3:String = seg4.titleForSegment(at: seg4.selectedSegmentIndex)!
        let p4:String = tfName.text!
        combinedBody = p1 + " for patient in room " + p3 + ". \nDiagnosis is " + p2  + ". \nPatient last name is " + p4 + ". \nThanks!"
    }
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        createBody();
        
        var emails = Array<String>()
        if(switch1.isOn){
            emails.append("cponce@northwell.edu")
        }
        if(switch2.isOn){
             
        }
        if(switch3.isOn){
            emails.append("tzhou1@northwell.edu")
        }
        if(switch4.isOn){
            emails.append("wtong@northwell.edu")
        }
        emails.append("nchang@northwell.edu")
        mailComposerVC.setToRecipients(emails)
        mailComposerVC.setSubject(subject)
        mailComposerVC.setMessageBody(combinedBody, isHTML: false)
        
        return mailComposerVC
    }
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController!, didFinishWith result: MFMailComposeResult, error: Error!) {
        controller.dismiss(animated: true, completion: nil)
        
    }

}
