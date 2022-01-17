//
//  CPView.swift
//  PatientInterface
//
//  Created by Kevin Chang on 1/6/17.
//  Copyright © 2017 KayGames. All rights reserved.
//

import UIKit

class CPView: UIView {
    struct variables{
        static var defaultColor: UIColor!
        static var cpString = ""
    }
    
    @IBOutlet weak var btn1D: UIButton!
    @IBOutlet weak var btn1W: UIButton!
    @IBOutlet weak var btn1M: UIButton!
    @IBOutlet weak var btn1Y: UIButton!
    
    @IBOutlet weak var btn2S: UIButton!
    @IBOutlet weak var btn2L1: UIButton!
    @IBOutlet weak var btn2R: UIButton!
    @IBOutlet weak var btn2U: UIButton!
    @IBOutlet weak var btn2L2: UIButton!
    
    @IBOutlet weak var btn3T: UIButton!
    @IBOutlet weak var btn3S: UIButton!
    @IBOutlet weak var btn3F: UIButton!
    @IBOutlet weak var btn3V: UIButton!

    @IBOutlet weak var btn5S: UIButton!
    @IBOutlet weak var btn5M: UIButton!
    @IBOutlet weak var btn5H: UIButton!
    @IBOutlet weak var btn5D: UIButton!
    
    @IBOutlet weak var btn4E: UIButtonWInfo!
    @IBOutlet weak var btn4I: UIButtonWInfo!
    @IBOutlet weak var btn4T: UIButtonWInfo!
    @IBOutlet weak var btn4M: UIButtonWInfo!
 
    
    @IBOutlet weak var switchE: UISegmentedControl!
    @IBOutlet weak var switchI: UISegmentedControl!
    @IBOutlet weak var switchT: UISegmentedControl!
    @IBOutlet weak var switchM: UISegmentedControl!
    func initialize(){
        variables.defaultColor = btn3T.currentTitleColor
        setBtnOff()
        setupSwitches()
    }
    func setupSwitches(){
        btn4E.setSwitch(input: switchE)
        btn4I.setSwitch(input: switchI)
        btn4T.setSwitch(input: switchT)
        btn4M.setSwitch(input: switchM)
    }
    func setBtnOff(){
        btn1D.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn1W.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn1M.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn1Y.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn2S.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn2L1.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn2R.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn2U.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn2L2.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn3T.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn3S.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn3F.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn3V.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn4E.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn4I.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn4T.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn4M.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn5S.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn5M.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn5H.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn5D.setTitleColor(UIColor.gray, for: UIControl.State.normal)
    }
    @IBAction func triggerColumn1(_ sender: UIButton) {
        if(sender.currentTitleColor == variables.defaultColor){
            sender.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            return
        }
        btn1D.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn1W.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn1M.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn1Y.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        sender.setTitleColor(variables.defaultColor, for: UIControl.State.normal)
    }
   
    @IBAction func triggerColumn2(_ sender: UIButton) {
        if(sender.currentTitleColor == variables.defaultColor){
            sender.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            return
        }
        btn2S.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn2L1.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn2R.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn2U.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn2L2.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        sender.setTitleColor(variables.defaultColor, for: UIControl.State.normal)
    }
    @IBAction func triggerColumn3(_ sender: UIButton) {
        if(sender.currentTitleColor == variables.defaultColor){
            sender.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            return
        }
        btn3T.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn3S.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn3F.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn3V.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        sender.setTitleColor(variables.defaultColor, for: UIControl.State.normal)
    }
    @IBAction func triggerColumn4(_ sender: UIButtonWInfo) {
        if(sender.currentTitleColor == variables.defaultColor){
            sender.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            sender.getSwitch().isHidden = true
            return
        }
        sender.setTitleColor(variables.defaultColor, for: UIControl.State.normal)
        sender.getSwitch().isHidden = false
    }
    @IBAction func triggerColumn5(_ sender: UIButton) {
        if(sender.currentTitleColor == variables.defaultColor){
            sender.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            return
        }
        btn5S.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn5M.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn5H.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btn5D.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        sender.setTitleColor(variables.defaultColor, for: UIControl.State.normal)
    }
    func setCPString(){
        var endString = ""
        var p1 = ""
        let defaultColor = variables.defaultColor
        if(btn1D.currentTitleColor == defaultColor){
            p1 = "days"
        }else if(btn1W.currentTitleColor == defaultColor){
            p1 = "weeks"
        }else if(btn1M.currentTitleColor == defaultColor){
            p1 = "months"
        }else if(btn1Y.currentTitleColor == defaultColor){
            p1 = "years"
        }else{
            p1 = ""
        }
        var p2 = ""
        if(btn2S.currentTitleColor == defaultColor){
            p2 = "substernal"
        }else if(btn2L1.currentTitleColor == defaultColor){
            p2 = "left-sided"
        }else if(btn2R.currentTitleColor == defaultColor){
            p2 = "right-sided"
        }else if(btn2U.currentTitleColor == defaultColor){
            p2 = "upper"
        }else if(btn2L2.currentTitleColor == defaultColor){
            p2 = "lower"
        }else{
            p2 = ""
        }
        var p3 = ""
        if(btn3T.currentTitleColor == defaultColor){
            p3 = "tightness"
        }else if(btn3S.currentTitleColor == defaultColor){
            p3 = "sharp pain"
        }else if(btn3F.currentTitleColor == defaultColor){
            p3 = "fullness"
        }else if(btn3V.currentTitleColor == defaultColor){
            p3 = "vague"
        }else{
            p3 = ""
        }
        var p40 = ""
        var p41 = ""
        var p42 = ""
        var p43 = ""
        if(btn4E.currentTitleColor == defaultColor){
            if(btn4E.getSwitch().selectedSegmentIndex == 0){
                btn4E.setInfo(phrase: "not related to exertion")
            }else{
                btn4E.setInfo(phrase: "worse with exertion")
            }
            p40 = btn4E.getInfo()
        }
        if(btn4I.currentTitleColor == defaultColor){
            if(btn4I.getSwitch().selectedSegmentIndex == 0){
                btn4I.setInfo(phrase: "not related to inspiration")
            }else{
                btn4I.setInfo(phrase: "worse with inspiration")
            }
            p41 = btn4I.getInfo()
        }
        if(btn4T.currentTitleColor == defaultColor){
            if(btn4T.getSwitch().selectedSegmentIndex == 0){
                btn4T.setInfo(phrase: "tender to touch")
            }else{
                btn4T.setInfo(phrase: "not tender to touch")
            }
            p42 = btn4T.getInfo()
        }
        if(btn4M.currentTitleColor == defaultColor){
            if(btn4M.getSwitch().selectedSegmentIndex == 0){
                btn4M.setInfo(phrase: "not related to meals")
            }else{
                btn4M.setInfo(phrase: "worse with meals")
            }
            p43 = btn4M.getInfo()
        }
        
        var p5 = ""
        if(btn5S.currentTitleColor == defaultColor){
            p5 = "seconds"
        }else if(btn5M.currentTitleColor == defaultColor){
            p5 = "minutes"
        }else if(btn5H.currentTitleColor == defaultColor){
            p5 = "hours"
        }else if(btn5D.currentTitleColor == defaultColor){
            p5 = "days"
        }else{
            p5 = ""
        }
        var array = [String]()
        if(p1 != ""){
            array.append(p1)
        }
        if(p2 != ""){
            array.append(p2)
        }
        if(p3 != ""){
            array.append(p3)
        }
        if(p40 != ""){
            array.append(p40)
        }
        if(p41 != ""){
            array.append(p41)
        }
        if(p42 != ""){
            array.append(p42)
        }
        if(p43 != ""){
            array.append(p43)
        }
        if(p5 != ""){
            array.append(p5)
        }
        let size = array.count - 1
        if(size >= 0){
            for i in 0...(size){
                print(i)
                if(i < size){
                    endString = endString + array[i] + ", "
                }else{
                    endString = endString + array[i]
                }
            }
        }
        variables.cpString = endString
    }
}
