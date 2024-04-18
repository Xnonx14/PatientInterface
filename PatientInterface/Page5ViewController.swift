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
    @IBOutlet weak var seg5: UISegmentedControl!
    @IBOutlet weak var switchbnan: UISwitch!
    
    
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
        seg5.selectedSegmentIndex = 0
        switch1.isOn = true
        switch2.isOn = true
        tfName.text = ""
    }
    func createBody(){
        subject = seg1.titleForSegment(at: seg1.selectedSegmentIndex)!
        
        if seg5.selectedSegmentIndex != 0{
            subject = subject + " for " + seg5.titleForSegment(at: seg5.selectedSegmentIndex)!
        }
        
        let p1:String = seg2.titleForSegment(at: seg2.selectedSegmentIndex)!
        var p2:String = seg3.titleForSegment(at: seg3.selectedSegmentIndex)!
        if(p2 == "AA"){
            p2 = "Aortic Aneurysm"
        }else if(p2 == "AF"){
            p2 = "Atrial fibrillation"
        }
        let p3:String = seg4.titleForSegment(at: seg4.selectedSegmentIndex)!
        let p4:String = tfName.text!
        
        var p5:String = seg5.titleForSegment(at: seg5.selectedSegmentIndex)!
        
        if seg5.selectedSegmentIndex != 0{
            p5 = ". For Dr." + p5
        }
        
        combinedBody = p1 + " for patient in room " + p3 + ". \nDiagnosis is " + p2  + p5 + ". \nPatient last name is " + p4 + ". \nThanks!"
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
            emails.append("awong13@northwell.edu")
        }
        if(switch3.isOn){
            emails.append("tzhou1@northwell.edu")
        }
        if(switch4.isOn){
            emails.append("cmoklomast@northwell.edu")
        }
        if(switchbnan.isOn){
            emails.append("bnan@northwell.edu")
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
