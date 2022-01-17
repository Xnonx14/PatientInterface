//
//  ReturningViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 12/29/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit
import MessageUI
class ReturningViewController: UIViewController, MFMailComposeViewControllerDelegate {
    struct variables{
        static var defaultColor: UIColor!
        static var viewCP: CPView!
        static var viewControllerSOB: SOBViewController!
        static var viewControllerPalps: PalpsViewController!
        static var currentInstance: ReturningViewController!
    }
    @IBOutlet weak var btnCP: UIButton!
    @IBOutlet weak var btnSOB: UIButton!
    @IBOutlet weak var btnPalps: UIButton!
    @IBOutlet weak var btnLight: UIButton!
    @IBOutlet weak var btnSync: UIButton!
    @IBOutlet weak var btnDizzy: UIButton!
    @IBAction func swiped(_ sender: UISwipeGestureRecognizer) {
        GeneralViewController.changeView(sender.direction.rawValue)
        
    }
    
    @IBAction func btnDizzyToggled(_ sender: UIButton) {
        toggleButton(sender)
    }
    @IBAction func btnSyncToggled(_ sender: UIButton) {
        toggleButton(sender)
    }
    @IBAction func btnLightToggled(_ sender: UIButton) {
        toggleButton(sender)
    }
    @IBAction func btnPalpsToggled(_ sender: UIButton) {
        toggleButton(sender)
        let defaultColor = btnClose.currentTitleColor
        if(sender.backgroundColor == defaultColor){
            viewWindow3.isHidden = false
        }else{
            viewWindow3.isHidden = true
        }
    }
    @IBAction func btnSOBToggled(_ sender: UIButton) {
        toggleButton(sender)
        let defaultColor = btnClose.currentTitleColor
        if(sender.backgroundColor == defaultColor){
            viewWindow2.isHidden = false
        }else{
            viewWindow2.isHidden = true
        }
    }
    @IBOutlet weak var btnClose: UIButton!
    @IBAction func btnCPToggled(_ sender: UIButton) {
        toggleButton(sender)
        let defaultColor = btnClose.currentTitleColor
        if(sender.backgroundColor == defaultColor){
            viewWindow1.isHidden = false
        }else{
            viewWindow1.isHidden = true
        }
    }
    @IBAction func sendMailBtnToggled(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    func testsBody()-> String{
        //TestsOrder
        var endString = ""
        var p1 = ""
        var p2 = ""
        var p3 = ""
        var p4 = ""
        var p5 = ""
        var p6 = ""
        if(btnTTE.currentTitleColor == variables.defaultColor){
            p1 = "TTE"
        }
        if(btnSTR.currentTitleColor == variables.defaultColor){
            p2 = "STR"
        }
        if(btnSTE.currentTitleColor == variables.defaultColor){
            p3 = "STE"
        }
        if(btnNUC.currentTitleColor == variables.defaultColor){
            p4 = "NUC"
        }
        if(btnHolta.currentTitleColor == variables.defaultColor){
            p5 = "Holta"
        }
        if(btnOXR.currentTitleColor == variables.defaultColor){
            p6 = "OXR"
        }
        var array2 = [String]()
        if(p1 != ""){
            array2.append(p1)
        }
        if(p2 != ""){
            array2.append(p2)
        }
        if(p3 != ""){
            array2.append(p3)
        }
        if(p4 != ""){
            array2.append(p4)
        }
        if(p5 != ""){
            array2.append(p5)
        }
        if(p6 != ""){
            array2.append(p6)
        }
        let size = array2.count - 1
        if(size>=0){
            endString = endString + "Tests order: "
            for j in 0...(size){
                if(j < size){
                    endString = endString + array2[j] + " "
                }else{
                    endString = endString + array2[j]
                }
            }
        }
        return endString
    }
    func followupBody()->String{
        var array3 = [String]()
        var part1 = segWeeks.titleForSegment(at: segWeeks.selectedSegmentIndex)!
        var part2 = segMonths.titleForSegment(at: segMonths.selectedSegmentIndex)!
        var part3 = segYears.titleForSegment(at: segYears.selectedSegmentIndex)!
        if(part1 != ""){
            if(segWeeks.selectedSegmentIndex == 1){
                part1 = part1 + " week"
            }else{
                part1 = part1 + " weeks"
            }
            array3.append(part1)
        }
        if(part2 != ""){
            if(segMonths.selectedSegmentIndex == 1){
                part2 = part2 + " month"
            }else{
                part2 = part2 + " months"
            }
            array3.append(part2)
        }
        if(part3 != ""){
            if(segYears.selectedSegmentIndex == 1){
                part3 = part3 + " year"
            }else{
                part3 = part3 + " years"
            }
            array3.append(part3)
        }
        let size = array3.count - 1
        var endString = ""
        if(size>=0){
            endString = endString + "Follow up: "
            for i in 0...(size){
                if(i < size){
                    endString = endString + array3[i] + ", "
                }else{
                    endString = endString + array3[i]
                }
            }
        }
        return endString
    }
    @IBOutlet weak var segYears: UISegmentedControl!
    @IBOutlet weak var segMonths: UISegmentedControl!
    @IBOutlet weak var segWeeks: UISegmentedControl!
    func createBody() -> String{
        var endString = ""
        variables.viewCP.setCPString()
        var endString0 = CPView.variables.cpString
        if(btnCP.backgroundColor == variables.defaultColor){
            
        }else if(btnCP.backgroundColor == UIColor.gray){
            endString0 = ""
        }else{
            endString0 = "No Chest Pain"
        }
        let endString1 = variables.viewControllerSOB.createSOBString()
        let endString2 = variables.viewControllerPalps.createString()
        let endString3 = testsBody()
        let endString4 = followupBody()
        var array = [String]()
        if(endString0 != ""){
            array.append(endString0)
        }
        if(endString1 != ""){
            array.append(endString1)
        }
        if(endString2 != ""){
            array.append(endString2)
        }
        if(endString2 != ""){
            array.append(endString3)
        }
        if(endString2 != ""){
            array.append(endString4)
        }
        let size = array.count - 1
        if(size >= 0){
            for i in 0...(size){
                if(i < size){
                    endString = endString + array[i] + "\n\n "
                }else{
                    endString = endString + array[i]
                }
            }
        }
        return endString
    }
    @IBAction func btnTestsOrder(_ sender: UIButton) {
        if(sender.currentTitleColor == UIColor.gray){
            sender.setTitleColor(variables.defaultColor, for: UIControl.State.normal)
        }else{
            sender.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        }
    }
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        let combinedBody = createBody();
        let mailAddress = "nchang@northwell.edu"
        mailComposerVC.setToRecipients([mailAddress])
        mailComposerVC.setSubject("Returning Patient")
        mailComposerVC.setMessageBody(combinedBody, isHTML: false)
        
        return mailComposerVC
    }
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
    }
    func setupButtonsHelper(_ sender: UIButton){
        sender.layer.cornerRadius = 0.5 * sender.bounds.size.width
        sender.clipsToBounds = true
        sender.backgroundColor = UIColor.gray
    }
    func setupButtonsHelper2(_ sender: UIButton){
        sender.setTitleColor(UIColor.gray, for: UIControl.State.normal)
    }
    @IBOutlet weak var btnSTR: UIButton!
    @IBOutlet weak var btnTTE: UIButton!
    @IBOutlet weak var btnSTE: UIButton!
    @IBOutlet weak var btnNUC: UIButton!
    @IBOutlet weak var btnHolta: UIButton!
    @IBOutlet weak var btnOXR: UIButton!
    func setupButtons(){
        setupButtonsHelper(btnCP)
        setupButtonsHelper(btnSOB)
        setupButtonsHelper(btnPalps)
        setupButtonsHelper(btnLight)
        setupButtonsHelper(btnSync)
        setupButtonsHelper(btnDizzy)
        setupButtonsHelper2(btnSTR)
        setupButtonsHelper2(btnTTE)
        setupButtonsHelper2(btnSTE)
        setupButtonsHelper2(btnNUC)
        setupButtonsHelper2(btnHolta)
        setupButtonsHelper2(btnOXR)
    }
    func toggleButton(_ sender: UIButton){
        var defaultColor = btnClose.currentTitleColor
        sender.setTitleColor(UIColor.black, for: UIControl.State.normal)
        if(sender.backgroundColor == defaultColor){
            sender.backgroundColor = UIColor.red
            sender.setTitle("No", for: UIControl.State.normal)
        }else if(sender.backgroundColor == UIColor.red){
            sender.backgroundColor = UIColor.gray
            sender.setTitle("", for: UIControl.State.normal)
        }else{
            sender.backgroundColor = defaultColor
            sender.setTitle("Yes", for: UIControl.State.normal)
        }
    }

    func closeWindows(){
        viewWindow1.isHidden = true
        viewWindow2.isHidden = true
        viewWindow3.isHidden = true
    }
    @IBAction func CloseBtnClicked(_ sender: Any) {
        closeWindows()
    }
    @IBOutlet weak var viewWindow1: UIView!
    @IBOutlet weak var viewWindow2: UIView!
    @IBOutlet weak var viewWindow3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        variables.currentInstance = self
        setupButtons()
        viewWindow1.isHidden = true
        
        viewWindow2.isHidden = true
        viewWindow3.isHidden = true
        variables.defaultColor = btnClose.currentTitleColor
        // Do any additional setup after loading the view.
    }
    var containerViewController: CPViewController?
    let containerSegueName = "testSegue"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let vc = segue.destination as? CPViewController {
            let cpview = vc.getView()
            cpview.initialize()
            variables.viewCP = cpview
        }
        else if let vc = segue.destination as? SOBViewController {
            variables.viewControllerSOB = vc
        }
        else if let vc = segue.destination as? PalpsViewController{
            variables.viewControllerPalps = vc
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
