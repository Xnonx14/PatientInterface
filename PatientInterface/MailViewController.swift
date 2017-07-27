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
    @IBOutlet weak var followSwitch: UISwitch!
    @IBOutlet weak var seg3: UISegmentedControl!
    @IBOutlet weak var seg2: UISegmentedControl!
    @IBOutlet weak var seg1: UISegmentedControl!
    @IBOutlet weak var mailAddress: UITextField!
    @IBOutlet weak var btn1: ToggleableButton!
    @IBOutlet weak var btn2: ToggleableButton!
    @IBOutlet weak var btn3: ToggleableButton!
    @IBOutlet weak var btn4: ToggleableButton!
    @IBOutlet weak var btn5: ToggleableButton!
    @IBOutlet weak var btn6: ToggleableButton!

    
    var combinedBody:String = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mailAddress.delegate = self
        // Do any additional setup after loading the view.
        /*
        btn1.setButtonOff()
        btn2.setButtonOff()
        btn3.setButtonOff()
        btn4.setButtonOff()
        btn5.setButtonOff()
        btn6.setButtonOff()
         */
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
        
        //START OF UPDATE 1
        var u1 = Array<Int>();
        u1.append(seg1.selectedSegmentIndex);
        u1.append(seg2.selectedSegmentIndex);
        u1.append(seg3.selectedSegmentIndex);
        combinedBody = par1 + "  " + par2 + "  " + par3 + SentencePage.update1(arr: u1,follow:followSwitch.isOn)
        
        //START OF UPDATE 2
        var u2 = Array<String>()
        if(btn1.isToggled()){
            u2.append("echo")
        }
        if(btn2.isToggled()){
            u2.append("treadmill stress test")
        }
        if(btn3.isToggled()){
            u2.append("stress echo")
        }
        if(btn4.isToggled()){
            u2.append("nuclear stress test")
        }
        if(btn5.isToggled()){
            u2.append("Holter")
        }
        if(btn6.isToggled()){
            u2.append("CXR")
        }
        if(u2.count != 0){
            combinedBody = combinedBody + SentencePage.update2(arr: u2)
        }
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
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
    }
    public func clearAll(_ btn:UIButton){
        seg1.selectedSegmentIndex = 0
        seg2.selectedSegmentIndex = 0
        seg3.selectedSegmentIndex = 0
        btn1.setButtonOff()
        btn2.setButtonOff()
        btn3.setButtonOff()
        btn4.setButtonOff()
        btn5.setButtonOff()
        btn6.setButtonOff()
    }
    
    
    
    
    
    
    
    
    
}
