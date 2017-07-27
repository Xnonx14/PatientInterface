//
//  FirstViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/4/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    var defaultColor = UIColor.lightGray
    var selectedColor: UIColor!
    var list = Array<UIButton>();
    var list2 = Array<UIButton>();
    @IBOutlet weak var switchGender: UISegmentedControl!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var btnHTN: UIButton!
    @IBOutlet weak var btnDM: UIButton!
    @IBOutlet weak var btnHLD: UIButton!
    @IBOutlet weak var btnNone: UIButton!
    @IBOutlet weak var btnSB: UIButton!
    @IBOutlet weak var btnClearAll: UIButton!
    @IBOutlet weak var btnPalps: UIButton!
    @IBOutlet weak var btnSync: UIButton!
    @IBOutlet weak var btnCP: UIButton!
    @IBOutlet weak var btnCAD: UIButton!
    @IBOutlet weak var btnECG: UIButton!
    @IBOutlet weak var btnCC: UIButton!
    struct variables{
        static var myController:FirstViewController!
        static var paragraph = "Default Text";
        static var gender = "he"
        static var tabChanged = false
        static var firstName = "";
        static var lastName = "";
    }
    @IBAction func SegmentChanged(_ sender: UISegmentedControl) {
        edited()
        
    }
    @IBAction func clearPages(_ sender: UIButton) {
        GeneralViewController.variables.page1.clearAll(btnClearAll)
        GeneralViewController.variables.page2.clearAllBtnPressed(btnClearAll)
        GeneralViewController.variables.page3.clearAll(btnClearAll)
        GeneralViewController.variables.page4.clearAll(btnClearAll)
    }
    @IBAction func Swiped(_ sender: UISwipeGestureRecognizer) {
        GeneralViewController.changeView(sender.direction.rawValue)
    }
    func edited(){
        barIcon.title = "1"
        GeneralViewController.prevent()
    }
    @IBAction func AgeChanged(_ sender: UITextField) {
        edited();
    }
    @IBAction func clearAll(_ sender: UIButton) {
        deselectAllButtons();
        list.removeAll()
        list2.removeAll()
        fName.text = "";
        LName.text = "";
        variables.firstName = "";
        variables.lastName = "";
        tfAge.text = "";
        switchGender.selectedSegmentIndex = 0;
        btnNone.setTitleColor(selectedColor, for: UIControlState())
        edited();
    }
    @IBAction func pressNone(_ sender: UIButton) {
        if(sender.currentTitleColor != defaultColor){
            return;
        }
        btnHTN.setTitleColor(defaultColor, for: UIControlState())
        btnDM.setTitleColor(defaultColor, for: UIControlState())
        btnHLD.setTitleColor(defaultColor, for: UIControlState())
        btnCAD.setTitleColor(defaultColor, for: UIControlState())
        list.removeAll()
        sender.setTitleColor(selectedColor, for: UIControlState())
        edited()
    }
    
    func registerButtonPMH(_ btn: UIButton){
        if(list.contains(btn)){
            list.remove(at: list.index(of: btn)!)
        }else{
            list.append(btn);
        }
        if(list.isEmpty){
            btnNone.setTitleColor(selectedColor, for: UIControlState())
        }
    }
    func registerButtonCC(_ btn: UIButton){
        if(list2.contains(btn)){
            list2.remove(at: list2.index(of: btn)!)
        }else{
            list2.append(btn);
        }
    }
    func deselectAllButtons(){
        let size = list.count;
        for i in 0..<size{
            list[i].setTitleColor(defaultColor, for: UIControlState())
        }
        let size2 = list2.count;
        for i in 0..<size2{
            list2[i].setTitleColor(defaultColor, for: UIControlState())
        }
    }
    @IBAction func fName(_ sender: UITextField) {
        variables.firstName = fName.text!
    }
    @IBAction func LName(_ sender: UITextField) {
        variables.lastName = LName.text!
    }
    @IBOutlet weak var barIcon: UITabBarItem!
    func save(){
        barIcon.title = "1 (saved)"
        GeneralViewController.proceed()
        let p1 = tfAge.text!+"-year-old "+switchGender.titleForSegment(at: switchGender.selectedSegmentIndex)!.lowercased() + " with ";
        var combo1 = "";
        //Collect all buttons that are pushed (btnCAD, btnHTN, btnDM, btnHLD)
        var tempList = Array<UIButton>()
        if(list.contains(btnCAD)){
            tempList.append(btnCAD)
        }
        if(list.contains(btnHTN)){
            tempList.append(btnHTN)
        }
        if(list.contains(btnDM)){
            tempList.append(btnDM)
        }
        if(list.contains(btnHLD)){
            tempList.append(btnHLD)
        }
        list = tempList;
        var temp = Array<String>()
        for i in 0..<list.count{
            temp.append(list[i].currentTitle!)
            if(list.count == 1 || i == list.count - 1){
                temp.append("")
            }else if(i == list.count - 2){
                temp.append(" and ")
            }else{
                temp.append(", ")
            }
        }
        for i in 0..<temp.count{
            combo1 += temp[i]
        }
        if(btnNone.currentTitleColor != defaultColor){
            combo1 = "no significant PMH"//if its selected
        }
        //combination of 4 using combo2
        var combo2 = Array<String>();
        for i in 0..<list2.count{
            combo2.append(list2[i].currentTitle!)
            if(i == list2.count - 2){
                combo2.append(" and ")
            }else if(i == list2.count - 1){
                combo2.append(".")
            }else{
                combo2.append(", ")
            }
        }
        var combined2 = "";
        for u in 0..<combo2.count{
            if(combo2[u].contains("abnl ECG")){
                combo2[u] = "abnormal ECG"
                combined2 += combo2[u]
            }else if(combo2[u].contains("SOB")){
                combo2[u] = "shortness of breath"
                combined2 += combo2[u]
            }else if(combo2[u].contains("Clearance")){
                combo2[u] = "Cardiac Clearance"
                combined2 += combo2[u]
            }else{
                combined2 += combo2[u].lowercased()
            }
            
        }
        //
        //combo2 = "Chest Pain, Shortness of Breath, Palpitations, and Syncope"
        variables.paragraph = p1 + combo1 + " presents for evaluation of " + combined2;
        
        if(switchGender.selectedSegmentIndex == 0){
            variables.gender = "he"
        }else if(switchGender.selectedSegmentIndex == 1){
            variables.gender = "she"
        }

    }
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var LName: UITextField!
    @IBOutlet weak var dizziness: UIButton!
    @IBAction func saveValues(_ sender: UIButton) {
        save()
        }
    @IBAction func btnPressedPMH(_ sender: UIButton) {
        edited()
        registerButtonPMH(sender);
        if(sender.currentTitleColor != defaultColor){
            sender.setTitleColor(defaultColor, for: UIControlState())
        }else{
            sender.setTitleColor(selectedColor, for: UIControlState())
            btnNone.setTitleColor(defaultColor, for: UIControlState())
        }
    }
    
    @IBOutlet weak var btnMurmur: UIButton!
    @IBAction func btnPressedCC(_ sender: UIButton) {
        edited()
        registerButtonCC(sender);
        if(sender.currentTitleColor != defaultColor){
            sender.setTitleColor(defaultColor, for: UIControlState())
        }else{
            sender.setTitleColor(selectedColor, for: UIControlState())
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if(selectedColor==nil){
            selectedColor = btnHTN.currentTitleColor;
        }
        //make all buttons in default state
        btnHTN.setTitleColor(defaultColor, for: UIControlState())
        btnDM.setTitleColor(defaultColor, for: UIControlState())
        btnHLD.setTitleColor(defaultColor, for: UIControlState())
        btnCP.setTitleColor(defaultColor, for: UIControlState())
        btnSB.setTitleColor(defaultColor, for: UIControlState())
        btnPalps.setTitleColor(defaultColor, for: UIControlState())
        btnSync.setTitleColor(defaultColor, for: UIControlState())
        btnCAD.setTitleColor(defaultColor, for: UIControlState())
        btnECG.setTitleColor(defaultColor, for: UIControlState())
        dizziness.setTitleColor(defaultColor, for: UIControlState())
        btnMurmur.setTitleColor(defaultColor, for: UIControlState())
        btnCC.setTitleColor(defaultColor, for: UIControlState())
        variables.myController = self
        btnNone.setTitleColor(selectedColor, for: UIControlState())
        tfAge.keyboardType = UIKeyboardType.numberPad;
        
        
        self.tfAge.delegate = self;
    }
    func textFieldShouldReturn(_ textField: UITextField)->Bool {
        self.view.endEditing(true);
        return false;
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

