//
//  FirstViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/4/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var defaultColor: UIColor!
    var list = Array<UIButton>();
    @IBOutlet weak var btnHTN: UIButton!
    @IBOutlet weak var btnDM: UIButton!
    @IBOutlet weak var btnHLD: UIButton!
    @IBOutlet weak var btnNone: UIButton!
    @IBAction func pressNone(sender: UIButton) {
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
    func deselectAllButtons(btn: UIButton){
        let size = list.count;
        let indexToAvoid = list.indexOf(btn);
        for i in 0..<size{
            if(i==indexToAvoid){
                continue;
            }
            list[i].setTitleColor(defaultColor, forState: UIControlState.Normal)
        }
    }
    @IBAction func btnPressed(sender: UIButton) {
        if(sender.currentTitleColor != defaultColor){
            sender.setTitleColor(defaultColor, forState: UIControlState.Normal)
        }else{
            sender.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
            if(sender != btnNone){
                btnNone.setTitleColor(defaultColor, forState: UIControlState.Normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(defaultColor==nil){
            defaultColor = btnHTN.currentTitleColor;
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

