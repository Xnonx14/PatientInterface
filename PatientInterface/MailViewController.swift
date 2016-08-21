//
//  Page2ViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/18/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit
import MessageUI

class MailViewController: UIViewController, MFMailComposeViewControllerDelegate,UITextFieldDelegate  {
    @IBOutlet weak var mailAddress: UITextField!
    @IBOutlet weak var subjectTF: UITextField!
    var combinedBody:String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mailAddress.delegate = self
        self.subjectTF.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Swiped(sender: UISwipeGestureRecognizer) {
        GeneralViewController.changeView(sender.direction.rawValue)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createBody(){
        //save all
        GeneralViewController.variables.page1.save()
        GeneralViewController.variables.page2.save()
        GeneralViewController.variables.page3.save()
        
        var par1 = FirstViewController.variables.paragraph;
        var par2 = Page2ViewController.variables.paragraph;
        var par3 = Page3ViewController.variables.paragraph;
        
        combinedBody = par1 + " " + par2 + " " + par3;
        
    }
    @IBAction func sendEmailButtonTapped(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        createBody();
        if(mailAddress.text == ""){
            mailAddress.text = "nchang@northwell.edu"
        }
        if(subjectTF.text == ""){
            subjectTF.text = "Patient Info"
        }
        mailComposerVC.setToRecipients([mailAddress.text!])
        mailComposerVC.setSubject(subjectTF.text!)
        mailComposerVC.setMessageBody(combinedBody, isHTML: false)
        
        return mailComposerVC
    }
    func textFieldShouldReturn(textField: UITextField)->Bool {
        self.view.endEditing(true);
        return false;
    }
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(controller: MFMailComposeViewController!, didFinishWithResult result: MFMailComposeResult, error: NSError!) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
