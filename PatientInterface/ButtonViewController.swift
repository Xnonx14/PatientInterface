//
//  ButtonViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 3/19/17.
//  Copyright © 2017 KayGames. All rights reserved.
//

import UIKit
import MessageUI

class ButtonViewController: UIViewController,MFMailComposeViewControllerDelegate {
    var combinedBody:String = ""
    
    @IBAction func clearPage(_ sender: Any) {
        setAllOff()
        nameField.text = ""
        combinedBody = ""
    }
    @IBOutlet weak var clearAll: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var btnS1: ToggleableButton!
    @IBOutlet weak var btnS2: ToggleableButton!
    @IBOutlet weak var btnS3: ToggleableButton!
    @IBOutlet weak var btnS4: ToggleableButton!
    @IBOutlet weak var btnS5: ToggleableButton!
    @IBOutlet weak var btnS6: ToggleableButton!
    
    @IBOutlet weak var btnF1: ToggleableButton!
    @IBOutlet weak var btnF2: ToggleableButton!
    @IBOutlet weak var btnF3: ToggleableButton!
    @IBOutlet weak var btnF4: ToggleableButton!
    
    @IBOutlet weak var btnP1: ToggleableButton!
    @IBOutlet weak var btnP2: ToggleableButton!
    @IBOutlet weak var btnP3: ToggleableButton!
    @IBOutlet weak var btnP4: ToggleableButton!
    @IBOutlet weak var btnP5: ToggleableButton!
    @IBOutlet weak var btnP6: ToggleableButton!
    @IBOutlet weak var btnP7: ToggleableButton!
    
    
    @IBOutlet weak var btnPlan1_1: ToggleableButton!
    @IBOutlet weak var btnPlan1_2: ToggleableButton!
    @IBOutlet weak var btnPlan1_3: ToggleableButton!
    @IBOutlet weak var btnPlan1_4: ToggleableButton!
    @IBOutlet weak var btnPlan1_5: ToggleableButton!
    @IBOutlet weak var btnPlan1_6: ToggleableButton!
    @IBOutlet weak var btnPlan2_1: ToggleableButton!
    @IBOutlet weak var btnPlan2_2: ToggleableButton!
    @IBOutlet weak var btnPlan2_3: ToggleableButton!
    @IBOutlet weak var btnPlan2_4: ToggleableButton!
    @IBOutlet weak var btnPlan2_5: ToggleableButton!
    @IBOutlet weak var btnPlan2_6: ToggleableButton!
    @IBOutlet weak var btnPlan3_1: ToggleableButton!
    @IBOutlet weak var btnPlan3_2: ToggleableButton!
    @IBOutlet weak var btnPlan3_3: ToggleableButton!
    @IBOutlet weak var btnPlan3_4: ToggleableButton!
    @IBOutlet weak var btnPlan3_5: ToggleableButton!
    @IBOutlet weak var btnPlan3_6: ToggleableButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAllOff()
    }

    func setAllOff(){
        btnF1.setButtonOff()
        btnF2.setButtonOff()
        btnF3.setButtonOff()
        btnF4.setButtonOff()
        
        btnS1.setButtonOff()
        btnS2.setButtonOff()
        btnS3.setButtonOff()
        btnS4.setButtonOff()
        btnS5.setButtonOff()
        btnS6.setButtonOff()
        
        btnP1.setButtonOff()
        btnP2.setButtonOff()
        btnP3.setButtonOff()
        btnP4.setButtonOff()
        btnP5.setButtonOff()
        btnP6.setButtonOff()
        btnP7.setButtonOff()
        
        btnPlan1_1.setButtonOff()
        btnPlan1_2.setButtonOff()
        btnPlan1_3.setButtonOff()
        btnPlan1_4.setButtonOff()
        btnPlan1_5.setButtonOff()
        btnPlan1_6.setButtonOff()
        btnPlan2_1.setButtonOff()
        btnPlan2_2.setButtonOff()
        btnPlan2_3.setButtonOff()
        btnPlan2_4.setButtonOff()
        btnPlan2_5.setButtonOff()
        btnPlan2_6.setButtonOff()
        btnPlan3_1.setButtonOff()
        btnPlan3_2.setButtonOff()
        btnPlan3_3.setButtonOff()
        btnPlan3_4.setButtonOff()
        btnPlan3_5.setButtonOff()
        btnPlan3_6.setButtonOff()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ButtonToggled(_ sender: ToggleableButton) {
        //sender.toggleButton()
        //I could either comment out 1 line of code or unlink like 32 buttons so im commenting it out.
    }

    @IBAction func sendMail(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    func setupMessage(){
        var p1 = ""
        if(btnS1.isToggled()){
            p1 += (btnS1.titleLabel?.text!)!
            p1 += " "
        }
        if(btnS2.isToggled()){
            p1 += (btnS2.titleLabel?.text!)!
            p1 += " "
        }
        if(btnS3.isToggled()){
            p1 += (btnS3.titleLabel?.text!)!
            p1 += " "
        }
        if(btnS4.isToggled()){
            p1 += (btnS4.titleLabel?.text!)!
            p1 += " "
        }
        if(btnS5.isToggled()){
            p1 += (btnS5.titleLabel?.text!)!
            p1 += " "
        }
        if(btnS6.isToggled()){
            p1 += (btnS6.titleLabel?.text!)!
            p1 += " "
        }
        if(p1 != ""){
            p1 += "\n\n"
        }
        var p2 = ""
        if(btnF1.isToggled()){
            p2 += (btnF1.titleLabel?.text!)!
            p2 += " "
        }
        if(btnF2.isToggled()){
            p2 += (btnF2.titleLabel?.text!)!
            p2 += " "
        }
        if(btnF3.isToggled()){
            p2 += (btnF3.titleLabel?.text!)!
            p2 += " "
        }
        if(btnF4.isToggled()){
            p2 += (btnF4.titleLabel?.text!)!
            p2 += " "
        }
        
        if(p2 != ""){
            p2 += "\n\n"
        }
        var p3 = ""
        if(btnP1.isToggled()){
            p3 += (btnP1.titleLabel?.text!)!
            p3 += " "
        }
        if(btnP2.isToggled()){
            p3 += (btnP2.titleLabel?.text!)!
            p3 += " "
        }
        if(btnP3.isToggled()){
            p3 += (btnP3.titleLabel?.text!)!
            p3 += " "
        }
        if(btnP4.isToggled()){
            p3 += (btnP4.titleLabel?.text!)!
            p3 += " "
        }
        if(btnP5.isToggled()){
            p3 += (btnP5.titleLabel?.text!)!
            p3 += " "
        }
        if(btnP6.isToggled()){
            p3 += (btnP6.titleLabel?.text!)!
            p3 += " "
        }
        if(btnP7.isToggled()){
            p3 += (btnP7.titleLabel?.text!)!
            p3 += " "
        }
        if(p3 != ""){
            p3 += "\n\n"
        }
        
        var p4 = ""
        if(btnPlan1_1.isToggled()){
            p4 += (btnPlan1_1.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan1_2.isToggled()){
            p4 += (btnPlan1_2.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan1_3.isToggled()){
            p4 += (btnPlan1_3.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan1_4.isToggled()){
            p4 += (btnPlan1_4.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan1_5.isToggled()){
            p4 += (btnPlan1_5.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan1_6.isToggled()){
            p4 += (btnPlan1_6.titleLabel?.text!)!
            p4 += " "
        }
        if(p4 != ""){
            p4 += "\n"
        }
        if(btnPlan2_1.isToggled()){
            p4 += (btnPlan2_1.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan2_2.isToggled()){
            p4 += (btnPlan2_2.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan2_3.isToggled()){
            p4 += (btnPlan2_3.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan2_4.isToggled()){
            p4 += (btnPlan2_4.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan2_5.isToggled()){
            p4 += (btnPlan2_5.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan2_6.isToggled()){
            p4 += (btnPlan2_6.titleLabel?.text!)!
            p4 += " "
        }
        if(p4 != ""){
            p4 += "\n"
        }
        
        if(btnPlan3_1.isToggled()){
            p4 += (btnPlan3_1.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan3_2.isToggled()){
            p4 += (btnPlan3_2.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan3_3.isToggled()){
            p4 += (btnPlan3_3.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan3_4.isToggled()){
            p4 += (btnPlan3_4.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan3_5.isToggled()){
            p4 += (btnPlan3_5.titleLabel?.text!)!
            p4 += " "
        }
        if(btnPlan3_6.isToggled()){
            p4 += (btnPlan3_6.titleLabel?.text!)!
            p4 += " "
        }
        if(p4 != ""){
            p4 += "\n"
        }
       
        
        combinedBody = p1 + p2 + p3 + p4
    }
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
    mailComposerVC.setToRecipients(["nchang@northwell.edu"])
        mailComposerVC.setSubject(nameField.text!)
        setupMessage()
        mailComposerVC.setMessageBody(combinedBody, isHTML: false)
        
        return mailComposerVC
    }
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    @IBAction func swiped(_ sender: Any) {
        GeneralViewController.changeView(2)
    }
    @IBAction func swiped2(_ sender: Any) {
        GeneralViewController.changeView(1)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController!, didFinishWith result: MFMailComposeResult, error: Error!) {
        controller.dismiss(animated: true, completion: nil)
        
    }
 

}
