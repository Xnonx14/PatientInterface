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
    var combinedBody:String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mailAddress.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Swiped(_ sender: UISwipeGestureRecognizer) {
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
        
        let par1 = FirstViewController.variables.paragraph;
        let par2 = Page2ViewController.variables.paragraph;
        let par3 = Page3ViewController.variables.paragraph;
        
        combinedBody = par1 + " " + par2 + " " + par3;
        
    }
    @IBAction func sendEmailButtonTapped(_ sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    func setupSubject() -> String{
        var subject = ""
        if(FirstViewController.variables.lastName != ""){
            subject = ("Patient Info: " + FirstViewController.variables.lastName)
            if(FirstViewController.variables.firstName != ""){
                subject = subject + (", "+FirstViewController.variables.firstName)
            }
        }else if(FirstViewController.variables.firstName != ""){
            subject = ("Patient Info: " + FirstViewController.variables.firstName)
        }else{
            subject = "Patient Info"
        }
        return subject
    }
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        createBody();
        mailAddress.text = "nchang@northwell.edu"
        mailComposerVC.setToRecipients([mailAddress.text!])
        mailComposerVC.setSubject(self.setupSubject())
        mailComposerVC.setMessageBody(combinedBody, isHTML: false)
        
        return mailComposerVC
    }
    func textFieldShouldReturn(_ textField: UITextField)->Bool {
        self.view.endEditing(true);
        return false;
    }
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController!, didFinishWith result: MFMailComposeResult, error: Error!) {
        controller.dismiss(animated: true, completion: nil)
        
    }
}
