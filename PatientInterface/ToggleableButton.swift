//
//  ToggleableButton.swift
//  PatientInterface
//
//  Created by Kevin Chang on 3/19/17.
//  Copyright © 2017 KayGames. All rights reserved.
//

import UIKit

class ToggleableButton: UIButton {
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
        print("Toggling")
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
}
