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
    var list = Array<UIButton>();
    @IBOutlet weak var switchGender: UISegmentedControl!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var btnHTN: UIButton!
    @IBOutlet weak var btnDM: UIButton!
    @IBOutlet weak var btnHLD: UIButton!
    @IBOutlet weak var btnNone: UIButton!
    @IBOutlet weak var btnClearAll: UIButton!
    @IBAction func clearAll(sender: UIButton) {
        deselectAllButtons();
        tfAge.text = "";
        switchGender.selectedSegmentIndex = 0;
    }
    @IBAction func pressNone(sender: UIButton) {
        registerButton(sender);
        if(sender.currentTitleColor != defaultColor){
            sender.setTitleColor(defaultColor, forState: UIControlState.Normal)
            return;
        }
        btnHTN.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnDM.setTitleColor(defaultColor, forState: UIControlState.Normal)
        btnHLD.setTitleColor(defaultColor, forState: UIControlState.Normal)
        sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
    }
    
    func registerButton(btn: UIButton){
        if(list.contains(btn)){
            return;
        }else{
            list.append(btn);
        }
    }
    func deselectAllButtons(){
        let size = list.count;
        for i in 0..<size{
            list[i].setTitleColor(defaultColor, forState: UIControlState.Normal)
        }
    }
    @IBAction func btnPressed(sender: UIButton) {
        registerButton(sender);
        if(sender.currentTitleColor != defaultColor){
            sender.setTitleColor(defaultColor, forState: UIControlState.Normal)
        }else{
            sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            if(sender != btnNone && (btnHTN==sender || btnDM == sender || btnHLD == sender)){
                btnNone.setTitleColor(defaultColor, forState: UIControlState.Normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

