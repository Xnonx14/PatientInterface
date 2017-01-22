//
//  UIButtonWInfo.swift
//  PatientInterface
//
//  Created by Kevin Chang on 1/2/17.
//  Copyright © 2017 KayGames. All rights reserved.
//

import UIKit

class UIButtonWInfo: UIButton {
    private var info: String!
    private var switchControl: UISegmentedControl!
    public func setSwitch(input: UISegmentedControl){
        switchControl = input
    }
    public func getSwitch()->UISegmentedControl{
        return switchControl
    }
    public func getInfo()-> String{
        
        return info
    }
    public func setInfo(phrase: String){
        self.info = phrase
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
