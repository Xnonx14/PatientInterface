//
//  ToggleableButton.swift
//  PatientInterface
//
//  Created by Kevin Chang on 3/19/17.
//  Copyright © 2017 KayGames. All rights reserved.
//

import UIKit

class ToggleableButton: UIButton {
    struct variables {
        static var set1 = [ToggleableButton]()
        static var set1FewFlag = false
        static var set2 = [ToggleableButton]()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setButtonOff()
        self.addTarget(self, action: #selector(self.toggleButton), for: .touchUpInside)
    }
    public func setButtonOn(){
        self.setTitleColor(UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1),for: UIControlState.normal)
    }
    public func setButtonOff(){
        self.setTitleColor(UIColor.gray, for: UIControlState.normal)
    }
    public func toggleButton(){
        if(self.accessibilityIdentifier != nil){
            if((self.accessibilityIdentifier?.hasPrefix("id"))!){
                if(self.currentTitle == "Default"){
                    if(self.isToggled()){
                        
                    }else{
                        for slot in variables.set1{
                            slot.setButtonOff()
                        }
                        variables.set1.removeAll(keepingCapacity: false)
                    }
                }
                else if(variables.set1.contains(self)){
                    let index = variables.set1.index(of: self)
                    variables.set1.remove(at: index!)
                    //continue to untoggle...
                }else{
                    //check to see if there are already two buttons toggled
                    if((variables.set1.count)>=2){
                        return
                    }else{
                        variables.set1.append(self)
                        Page2ViewController.variables.set1DefaultVar.setButtonOff()
                    }
                }
            }
            if(self.accessibilityIdentifier?.hasPrefix("sd"))!{
                if(self.currentTitle == "Default"){
                    if(self.isToggled()){
                        
                    }else{
                        for slot in variables.set2{
                            slot.setButtonOff()
                        }
                        variables.set2.removeAll(keepingCapacity: false)
                    }
                }
                else if(variables.set2.contains(self)){
                    let index = variables.set2.index(of: self)
                    variables.set2.remove(at: index!)
                    //continue to untoggle...
                }else{
                    //check to see if there are already two buttons toggled
                    if((variables.set2.count)>=2){
                        return
                    }else{
                        variables.set2.append(self)
                        Page2ViewController.variables.set2DefaultVar.setButtonOff()
                    }
                }
            }
        }
        
        if(self.currentTitleColor != UIColor.gray){
            setButtonOff()
        }else{
            setButtonOn()
        }
    }
    public func isToggled()->Bool{
        if(self.currentTitleColor == UIColor.gray){
            return false
        }else{
            return true
        }
    }
    public static func clearSet1(){
        let size = variables.set1.count
        for i in 0..<size{
            variables.set1[i].setButtonOff()
        }
        variables.set1.removeAll()
        Page2ViewController.variables.set1DefaultVar.setButtonOn()
    }
    public static func clearSet2(){
        let size = variables.set2.count
        for i in 0..<size{
            variables.set2[i].setButtonOff()
        }
        
        variables.set2.removeAll()
        Page2ViewController.variables.set2DefaultVar.setButtonOn()
    }
}
