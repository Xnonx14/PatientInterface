//
//  Page3ViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/19/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit

class Page3ViewController: UIViewController {

    @IBOutlet weak var barLabel: UITabBarItem!
    @IBOutlet weak var SOB: UISegmentedControl!
    @IBOutlet weak var SOBDur: UISegmentedControl!
    @IBOutlet weak var Palpitations1: UISegmentedControl!
    @IBOutlet weak var Palpitations2: UISegmentedControl!
    @IBOutlet weak var Palpitations3: UISegmentedControl!
    @IBOutlet weak var Palpitations4: UISegmentedControl!
    @IBOutlet weak var PalpsDuration: UISegmentedControl!
    var list = Array<UISegmentedControl>()
    
    struct variables{
        static var paragraph = ""
        static var included: Bool = false
        static var myController: Page3ViewController!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        variables.myController = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Swiped(_ sender: UISwipeGestureRecognizer) {
        GeneralViewController.changeView(sender.direction.rawValue)
    }
    @IBAction func changed(_ sender: UISegmentedControl) {
        if(!list.contains(sender)){
            list.append(sender)
        }
        if(sender.selectedSegmentIndex == 0){
            list.remove(at: list.index(of: sender)!)
        }
        barLabel.title = "3"
    }
    @IBAction func clearAll(_ sender: UIButton) {
        let size = list.count
        
        for i in 0..<size{
            list[i].selectedSegmentIndex = 0
        }
    }
    func isAllPalpDefault()->Bool{
        var total = 0
        total += Palpitations1.selectedSegmentIndex
        total += Palpitations2.selectedSegmentIndex
        total += Palpitations3.selectedSegmentIndex
        total += Palpitations4.selectedSegmentIndex
        total += PalpsDuration.selectedSegmentIndex
        if(total != 0){
            return false
        }else{
            return true
        }
        
    }
    func save(){
        if(SOB == nil){
            return
        }
        //list contains all the relevant information but is not in any specific order
        var list2 = Array<UISegmentedControl>()
        var sentence1 = ""
        var sentence2 = "  "
        if(SOB.selectedSegmentIndex != 0 || SOBDur.selectedSegmentIndex != 0){
            list2.append(SOB)
            list2.append(SOBDur)
            
            //SOB sentence Formation
            let c = list2[0].selectedSegmentIndex
            var p1 = ""
            switch(c){
            case 1:
                p1 = "Patient denies SOB"
            case 2:
                p1 = "Patient reports SOB with exertion"
            case 3:
                p1 = "Patient reports SOB at rest"
            default:
                p1 = ""
            }
            let d = list2[1].selectedSegmentIndex
            var p2 = ""
            switch(d){
            case 1:
                p2 = " for the past few days."
            case 2:
                p2 = " for the past few weeks."
            case 3:
                p2 = " for the past few months."
            case 4:
                p2 = " for the past few years."
            default:
                p2 = "."
            }
            sentence1 = p1 + p2
        }
        var list3 = Array<UISegmentedControl>()
        if(!isAllPalpDefault()){
            list3.append(Palpitations1)
            list3.append(Palpitations2)
            list3.append(Palpitations3)
            list3.append(Palpitations4)
            list3.append(PalpsDuration)
            
            let a = list3[0].selectedSegmentIndex
            let b = list3[1].selectedSegmentIndex
            let c = list3[2].selectedSegmentIndex
            let d = list3[3].selectedSegmentIndex
            let e = list3[4].selectedSegmentIndex
            var p1 = ""
            var p2 = ""
            var p3 = ""
            var p4 = ""
            var p5 = ""
            switch(a){
            case 0: p1 = ""
            case 1: p1 = "Patient reports palpitations"
            case 2: p1 = "Patient denies palpitations"
            default: ""
            }
            switch(b){
            case 1: p2 = " described as fast heartbeats"
            case 2: p2 = " described as strong but not fast heartbeats"
            default: ""
            }
            switch(c){
            case 1: p3 = " occurring with exertion"
            case 2: p3 = " occurring at rest"
            default: ""
            }
            switch(d){
            case 1: p4 = " regular in rhythm"
            case 2: p4 = " irregular in rhythm"
            default: ""
            }
            switch (e){
            case 1: p5 = " lasting seconds"
            case 2: p5 = " lasting minutes"
            case 3: p5 = " lasting hours"
            case 4: p5 = " lasting days"
            default: ""
            }
            var list4 = Array<String>()
            if(p1 != ""){
                list4.append(p1)
            }
            if(p2 != ""){
                list4.append(p2)
            }
            if(p3 != ""){
                list4.append(p3)
            }
            if(p4 != ""){
                list4.append(p4)
            }
            if(p5 != ""){
                list4.append(p5)
            }
            var list5 = Array<String>()
            let size = list4.count
            for i in 0..<size{
                list5.append(list4[i])
                if(i == size - 1){
                    list5.append(".")
                }else{
                    list5.append(",")
                }
            }
            let size2 = list5.count
            for u in 0..<size2{
                sentence2 += list5[u]
            }
        }
        variables.paragraph = sentence1 + sentence2
        barLabel.title = "3 (saved)"
        
        let f = syncope.selectedSegmentIndex
        var sentence3 = ""
        switch(f){
        case 1:
            sentence3 = "  Patient recalls episodes of syncope."
        case 2:
            sentence3 = "  Patient denies history of syncope."
        default:
            sentence3 = ""
        }
        
        variables.paragraph += sentence3
        
        
        
    }
    
    @IBOutlet weak var syncope: UISegmentedControl!

}
