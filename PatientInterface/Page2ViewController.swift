//
//  Page2ViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/18/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController {
    @IBOutlet weak var set2Default: ToggleableButton!
    @IBOutlet weak var set1Default: ToggleableButton!
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
        static var set1DefaultVar: ToggleableButton!
        static var set2DefaultVar: ToggleableButton!
    }
    @IBAction func Swiped(_ sender: UISwipeGestureRecognizer) {
        GeneralViewController.changeView(sender.direction.rawValue)
    }
    
    @IBAction func clearAllBtnPressed(_ sender: UIButton) {
        let size = segList.count
        for i in 0..<size{
            segList[i].selectedSegmentIndex = 0
        }
        ToggleableButton.clearSet1()
        ToggleableButton.clearSet2()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        variables.myController = self
        variables.set1DefaultVar = set1Default
        variables.set2DefaultVar = set2Default
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
        
        var set1 = ToggleableButton.variables.set1
        
        
        
        
        var time: String = (timeSegment.titleForSegment(at: timeSegment.selectedSegmentIndex)?.lowercased())!

        let gender:String = FirstViewController.variables.gender.lowercased()
        var locat:String = (locationSegment.titleForSegment(at: locationSegment.selectedSegmentIndex)?.lowercased())!
        locat = locat + " "
        if(timeSegment.selectedSegmentIndex == 0){
            time = ""
        }else if(set1Default.isToggled()){
            time = "for the past few " + time + " "
        }else if(set1.count == 1){
            let num1 = Int(set1[0].currentTitle!)
            if(num1 == 1){
                let choice = timeSegment.selectedSegmentIndex
                if(choice == 1){
                    time = "hour"
                }else if(choice == 2){
                    time = "day"
                }else if(choice == 3){
                    time = "week"
                }else if choice == 4{
                    time = "month"
                }else if choice == 5{
                    time = "year"
                }
                
            }
            time = "for the past " + set1[0].currentTitle! + " " + time + " "
        }else if(set1.count == 2){
            let num1 = Int(set1[0].currentTitle!)
            let num2 = Int(set1[1].currentTitle!)
            if(num1! < num2!){
                let range = (num1?.description)! + "-" + (num2?.description)!
                time = "for the past " + range + " " + time + " "
            }else{
                let range = (num2?.description)! + "-" + (num1?.description)!
                time = "for the past " + range + " " + time + " "
            }
            
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
        if(qual != ""){
            par1 += qual
        }
        
        //combo exertion, pleuritic, tenderness, meals
        var combo1 = "" //exert + pleur + tend + meal
        var list1 = Array<String>();
        
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
        let size = list1.count
        if(size == 0){
            combo1 = ", "
        }else if(size == 1){
            combo1 = ", " + list1[0]
            if(duration.selectedSegmentIndex != 0){
               combo1 += ", "
            }
        }else{
            combo1 += ", "
            for i in 0..<size{
                combo1 = combo1 + list1[i]
                if(i != size - 1){
                    combo1 += ", "
                }
            }
            if(duration.selectedSegmentIndex != 0){
                combo1 = combo1 + ", "
            }
        }
        
        var dura:String = (duration.titleForSegment(at: duration.selectedSegmentIndex)?.lowercased())!
        
        let count = ToggleableButton.variables.set2.count
        let set2 = ToggleableButton.variables.set2
        var number = ""
        var range = ""
        
        if(dura == "default"){
            dura = ""
        }else{
            if(set2Default.isToggled()){
                dura = "lasting " + dura
            }else{
                if(count == 1){
                    print(set2[0].currentTitle!)
                    let num1 = Int(set2[0].currentTitle!)!
                    if(num1 == 1){
                        let index = duration.selectedSegmentIndex
                        if index == 1{
                            dura = "second"
                        }else if index == 2{
                            dura = "minute"
                        }else if index == 3{
                            dura = "hour"
                        }else if index == 4{
                            dura = "day"
                        }
                    }
                    number = num1.description
                    
                    if(dura != "default"){
                        dura = "lasting " + num1.description + " " + dura
                    }else{
                        dura = ""
                    }
                    
                }else if(count == 2){
                    let num1:Int = Int(set2[0].currentTitle!)!
                    let num2:Int = Int(set2[1].currentTitle!)!
                    
                    if(num1 < num2){
                        range = num1.description + "-" + num2.description
                    }else{
                        range = num2.description + "-" + num1.description
                    }
                    
                    if(dura != "default"){
                        dura = "lasting " + range + " " +  dura
                    }else{
                        dura = ""
                    }
                }
                
            }

        }
        
        
        
        variables.paragraph = par1 + combo1 + dura + "."
        if(chestPain.selectedSegmentIndex == 1){
            variables.paragraph = "Patient denies chest pain."
        }
        barLabel.title = "2 (saved)"
    }
    @IBAction func dataChanged(_ sender: UISegmentedControl) {
        barLabel.title = "2"
        if(!segList.contains(sender)){
            segList.append(sender)
        }
        var check = true
        let size = segList.count
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
