//
//  FirstViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/4/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    var defaultColor = UIColor.lightGrayColor()
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
    struct variables{
        static var myController:FirstViewController!
        static var paragraph = "Default Text";
        static var gender = "he"
        static var tabChanged = false
    }
    @IBAction func SegmentChanged(sender: UISegmentedControl) {
        edited()
        
    }
    @IBAction func clearPages(sender: UIButton) {
        GeneralViewController.variables.page1.clearAll(btnClearAll)
        GeneralViewController.variables.page2.clearAllBtnPressed(btnClearAll)
        GeneralViewController.variables.page3.clearAll(btnClearAll)
    }
    @IBAction func Swiped(sender: UISwipeGestureRecognizer) {
        GeneralViewController.changeView(sender.direction.rawValue)
    }
    func edited(){
        barIcon.title = "1"
        GeneralViewController.prevent()
    }
    @IBAction func AgeChanged(sender: UITextField) {
        edited();
    }
    @IBAction func clearAll(sender: UIButton) {
        deselectAllButtons();
        list.removeAll()
        list2.removeAll()
        tfAge.text = "";
        switchGender.selectedSegmentIndex = 0;
        btnNone.setTitleColor(selectedColor, forState: UIControlState.Normal)
        edited();
    }
    @IBAction func pressNone(sender: UIButton) {
        if(sender.currentTitleColor != defaultColor){
            return;
        }
        btnHTN.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnDM.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnHLD.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnCAD.setTitleColor(defaultColor, forState: UIControlState.Normal)
        list.removeAll()
        sender.setTitleColor(selectedColor, forState: UIControlState.Normal)
        edited()
    }
    
    func registerButtonPMH(btn: UIButton){
        if(list.contains(btn)){
            list.removeAtIndex(list.indexOf(btn)!)
        }else{
            list.append(btn);
        }
        if(list.isEmpty){
            btnNone.setTitleColor(selectedColor, forState: UIControlState.Normal)
        }
    }
    func registerButtonCC(btn: UIButton){
        if(list2.contains(btn)){
            list2.removeAtIndex(list2.indexOf(btn)!)
        }else{
            list2.append(btn);
        }
    }
    func deselectAllButtons(){
        let size = list.count;
        for i in 0..<size{
            list[i].setTitleColor(defaultColor, forState: UIControlState.Normal)
        }
        let size2 = list2.count;
        for i in 0..<size2{
            list2[i].setTitleColor(defaultColor, forState: UIControlState.Normal)
        }
    }
    @IBOutlet weak var barIcon: UITabBarItem!
    func save(){
        barIcon.title = "1 (saved)"
        GeneralViewController.proceed()
        var p1 = tfAge.text!+"-year-old "+switchGender.titleForSegmentAtIndex(switchGender.selectedSegmentIndex)!.lowercaseString + " with ";
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
            if(combo2[u].containsString("abnl ECG")){
                combo2[u] = "abnormal ECG"
                combined2 += combo2[u]
            }else if(combo2[u].containsString("SOB")){
                combo2[u] = "shortness of breath"
                combined2 += combo2[u]
            }else{
                combined2 += combo2[u].lowercaseString
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
    @IBOutlet weak var dizziness: UIButton!
    @IBAction func saveValues(sender: UIButton) {
        save()
        }
    @IBAction func btnPressedPMH(sender: UIButton) {
        edited()
        registerButtonPMH(sender);
        if(sender.currentTitleColor != defaultColor){
            sender.setTitleColor(defaultColor, forState: UIControlState.Normal)
        }else{
            sender.setTitleColor(selectedColor, forState: UIControlState.Normal)
            btnNone.setTitleColor(defaultColor, forState: UIControlState.Normal)
        }
    }
    
    @IBOutlet weak var btnMurmur: UIButton!
    @IBAction func btnPressedCC(sender: UIButton) {
        edited()
        registerButtonCC(sender);
        if(sender.currentTitleColor != defaultColor){
            sender.setTitleColor(defaultColor, forState: UIControlState.Normal)
        }else{
            sender.setTitleColor(selectedColor, forState: UIControlState.Normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if(selectedColor==nil){
            selectedColor = btnHTN.currentTitleColor;
        }
        //make all buttons in default state
        btnHTN.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnDM.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnHLD.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnCP.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnSB.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnPalps.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnSync.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnCAD.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnECG.setTitleColor(defaultColor, forState: UIControlState.Normal)
        dizziness.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnMurmur.setTitleColor(defaultColor, forState: UIControlState.Normal)
        variables.myController = self
        btnNone.setTitleColor(selectedColor, forState: UIControlState.Normal)
        tfAge.keyboardType = UIKeyboardType.NumberPad;
        
        
        self.tfAge.delegate = self;
    }
    func textFieldShouldReturn(textField: UITextField)->Bool {
        self.view.endEditing(true);
        return false;
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

