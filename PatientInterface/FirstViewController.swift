//
//  FirstViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/4/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    var defaultColor: UIColor!
    var selectedColor = UIColor.lightGrayColor()
    var list = Array<UIButton>();
    var list2 = Array<UIButton>();
    @IBOutlet weak var switchGender: UISegmentedControl!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var btnHTN: UIButton!
    @IBOutlet weak var btnDM: UIButton!
    @IBOutlet weak var btnHLD: UIButton!
    @IBOutlet weak var btnNone: UIButton!
    @IBOutlet weak var btnClearAll: UIButton!
    struct variables{
        static var paragraph = "Default Text";
    }
    @IBAction func SegmentChanged(sender: UISegmentedControl) {
        barIcon.title = "1"
    }
    @IBAction func AgeChanged(sender: UITextField) {
        barIcon.title = "1"
    }
    @IBAction func clearAll(sender: UIButton) {
        deselectAllButtons();
        list.removeAll()
        list2.removeAll()
        tfAge.text = "";
        switchGender.selectedSegmentIndex = 0;
        btnNone.setTitleColor(selectedColor, forState: UIControlState.Normal)
        barIcon.title = "1"
    }
    @IBAction func pressNone(sender: UIButton) {
        if(sender.currentTitleColor != defaultColor){
            return;
        }
        btnHTN.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnDM.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnHLD.setTitleColor(defaultColor, forState: UIControlState.Normal)
        list.removeAll()
        sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        barIcon.title = "1"
    }
    
    func registerButtonPMH(btn: UIButton){
        if(list.contains(btn)){
            list.removeAtIndex(list.indexOf(btn)!)
        }else{
            list.append(btn);
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
    @IBAction func saveValues(sender: UIButton) {
        barIcon.title = "1 (saved)"
        var p1 = tfAge.text!+"-year-old "+switchGender.titleForSegmentAtIndex(switchGender.selectedSegmentIndex)!.lowercaseString + " with ";
        var combo1 = "";
        if(btnNone.currentTitleColor != defaultColor){
            combo1 = "no significant Personal Medical History"//if its selected
        }else if(btnHLD.currentTitleColor == btnDM.currentTitleColor && btnHTN.currentTitleColor == btnHLD.currentTitleColor && btnHLD != defaultColor){
            combo1 = "HTN, DM and HLD"
        }else if(btnHTN.currentTitleColor == btnDM.currentTitleColor && btnHTN.currentTitleColor == selectedColor){ //combination of 2 words
            combo1 = "HTN and DM"
        }else if(btnHTN.currentTitleColor == btnHLD.currentTitleColor && btnHTN.currentTitleColor == selectedColor){ //combination of 2 words
            combo1 = "HTN and HLD"
        }else if(btnDM.currentTitleColor == btnHLD.currentTitleColor && btnDM.currentTitleColor == selectedColor){ //combination of 2 words
            combo1 = "DM and HLD"
        }else if(btnHTN.currentTitleColor == selectedColor){ //one word
            combo1 = "HTN"
        }else if(btnDM.currentTitleColor == selectedColor){
            combo1 = "DM"
        }else if(btnHLD.currentTitleColor == selectedColor){
            combo1 = "HLD"
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
            print("value: "+combo2[u])
            combined2 = combined2.stringByAppendingString(combo2[u])
        }
        combined2 = combined2.lowercaseString
        //
        //combo2 = "Chest Pain, Shortness of Breath, Palpitations, and Syncope"
        variables.paragraph = p1 + combo1 + " presents for evaluation of " + combined2;
    }
    @IBAction func btnPressedPMH(sender: UIButton) {
        barIcon.title = "1"
        registerButtonPMH(sender);
        if(sender.currentTitleColor != defaultColor){
            sender.setTitleColor(defaultColor, forState: UIControlState.Normal)
        }else{
            sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            if(sender != btnNone && (btnHTN==sender || btnDM == sender || btnHLD == sender)){
                btnNone.setTitleColor(defaultColor, forState: UIControlState.Normal)
            }
        }
    }
    @IBAction func btnPressedCC(sender: UIButton) {
        barIcon.title = "1"
        registerButtonCC(sender);
        if(sender.currentTitleColor != defaultColor){
            sender.setTitleColor(defaultColor, forState: UIControlState.Normal)
        }else{
            sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNone.setTitleColor(selectedColor, forState: UIControlState.Normal)
        tfAge.keyboardType = UIKeyboardType.NumberPad;
        if(defaultColor==nil){
            defaultColor = btnHTN.currentTitleColor;
        }
        
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

