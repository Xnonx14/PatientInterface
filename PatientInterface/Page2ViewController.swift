//
//  Page2ViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/18/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController {
    @IBOutlet weak var barLabel: UITabBarItem!
    @IBOutlet weak var timeSegment: UISegmentedControl!
    @IBOutlet weak var locationSegment: UISegmentedControl!
    @IBOutlet weak var duration: UISegmentedControl!
    @IBOutlet weak var quality: UISegmentedControl!
    @IBOutlet weak var exertion: UISegmentedControl!
    @IBOutlet weak var pleuritic: UISegmentedControl!
    @IBOutlet weak var tenderness: UISegmentedControl!
    @IBOutlet weak var meals: UISegmentedControl!
    @IBOutlet weak var chestPain: UISegmentedControl!
    var segList = Array<UISegmentedControl>();
    var list = Array<UIButton>();
    struct variables{
        static var paragraph: String = ""
        static var myController: Page2ViewController!
        static var included:Bool = false
    }
    @IBAction func Swiped(sender: UISwipeGestureRecognizer) {
        GeneralViewController.changeView(sender.direction.rawValue)
    }
    
    @IBAction func clearAllBtnPressed(sender: UIButton) {
        var size = segList.count
        for i in 0..<size{
            segList[i].selectedSegmentIndex = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        variables.myController = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func save(){
        if(timeSegment == nil){
            return
        }
        var time: String = (timeSegment.titleForSegmentAtIndex(0)?.lowercaseString)!//timeSegment.selectedSegmentIndex
        var gender:String = FirstViewController.variables.gender.lowercaseString
        var locat:String = (locationSegment.titleForSegmentAtIndex(locationSegment.selectedSegmentIndex)?.lowercaseString)!
        locat = locat + " "
        if(timeSegment.selectedSegmentIndex == 0){
            time = ""
        }else{
            time = "for the past few " + time + ", "
        }
        if(locationSegment.selectedSegmentIndex == 0){
            locat = ""
        }
        var par1 = "Patient reports that " + time + gender + " has been experiencing episodes of " + locat + "chest discomfort, described as "
        
        var qual = ""
        switch(quality.selectedSegmentIndex){
        case 0:
            qual = ""
        case 1:
            qual = "tightness"
        case 2:
            qual = "sharp pain"
        case 3:
            qual = "fullness"
        case 4:
            qual = "vague in nature"
            
        default:
            qual = ""
        }
        var exert = ""
        switch(exertion.selectedSegmentIndex){
        case 0:
            exert = ""
        case 1:
            exert = "worse with exertion"
        case 2:
            exert = "not related to exertion"
        default:
            exert = ""
        }
        var pleur = ""
        switch(pleuritic.selectedSegmentIndex){
        case 0:
            pleur = ""
        case 1:
            pleur = "worse with inspiration"
        case 2 :
            pleur = "not related to inspiration"
        default:
            pleur = ""
        }
        var tend = "";
        switch(tenderness.selectedSegmentIndex){
        case 0:
            tend = ""
        case 1:
            tend = "tender to touch"
        case 2:
            tend = "not tender to touch"
        default:
            tend = ""
        }
        var meal = ""
        switch(meals.selectedSegmentIndex){
        case 0:
            meal = ""
        case 1:
            meal = "worse with meals"
        case 2:
            meal = "not related to meals"
        default:
            meal = ""
        }
        //combo (quality, exertion, pleuritic, tenderness, meals
        
        var combo1 = "" //qual + exert + pleur + tend + meal
        var list1 = Array<String>();
        if(qual != ""){
            list1.append(qual)
        }
        if(exert != ""){
            list1.append(exert)
        }
        if(pleur != ""){
            list1.append(pleur)
        }
        if(tend != ""){
            list1.append(tend)
        }
        if(meal != ""){
            list1.append(meal)
        }
        var size = list1.count
        for i in 0..<size{
            combo1 = combo1 + list1[i]
            if(i == size - 2 && size != 1){
                combo1 = combo1 + " and "
            }else if(size != 1 && duration.selectedSegmentIndex != 0){
                combo1 = combo1 + ", "
            }
            
        }
        
        var dura:String = (duration.titleForSegmentAtIndex(duration.selectedSegmentIndex)?.lowercaseString)!
        if(dura != "default"){
            dura = "lasting for " + dura
        }else{
            dura = ""
        }
        variables.paragraph = par1 + combo1 + dura + "."
        if(chestPain.selectedSegmentIndex == 1){
            variables.paragraph = "Patient denies chest pain."
        }
        barLabel.title = "2 (saved)"
    }
    @IBAction func dataChanged(sender: UISegmentedControl) {
        barLabel.title = "2"
        if(!segList.contains(sender)){
            segList.append(sender)
        }
        var check = true
        var size = segList.count
        for i in 0..<size{
            if(segList[i].selectedSegmentIndex != 0){
                check = false
            }
        } // if check is false, that means that something is not at the default meaning we should include the second paragraph.
        if(!check){
            variables.included = true
        }else{
            variables.included = false
        }
    }
    

}
