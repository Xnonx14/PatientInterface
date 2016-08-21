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
    var combinedBody = ""
    var subject = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func Swiped(sender: UISwipeGestureRecognizer) {
        GeneralViewController.changeView(sender.direction.rawValue)
        
    }
    @IBAction func sendEmailButtonTapped(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    func textFieldShouldReturn(textField: UITextField)->Bool {
        self.view.endEditing(true);
        return false;
    }
    func createBody(){
        subject = seg1.titleForSegmentAtIndex(seg1.selectedSegmentIndex)!
        var p1:String = seg2.titleForSegmentAtIndex(seg2.selectedSegmentIndex)!
        var p2:String = seg3.titleForSegmentAtIndex(seg3.selectedSegmentIndex)!
        var p3:String = seg4.titleForSegmentAtIndex(seg4.selectedSegmentIndex)!
        var p4:String = tfName.text!
        combinedBody = p1 + " for patient in room " + p3 + ". Diagnosis is " + p2  + ". Patient last name is " + p4 + ". Thanks!"
        
    }
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        createBody();
        
        mailComposerVC.setToRecipients(["cponce@northwell.edu"])
        mailComposerVC.setSubject(subject)
        mailComposerVC.setMessageBody(combinedBody, isHTML: false)
        
        return mailComposerVC
    }
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }

}
