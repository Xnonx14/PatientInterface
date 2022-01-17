//
//  PalpsViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 1/8/17.
//  Copyright © 2017 KayGames. All rights reserved.
//

import UIKit

class PalpsViewController: UIViewController {

    @IBOutlet weak var btnF: UIButton!
    @IBOutlet weak var btnN: UIButton!
    @IBOutlet weak var btnE2: UIButton!
    @IBOutlet weak var btnR2: UIButton!
    @IBOutlet weak var btnR3: UIButton!
    @IBOutlet weak var btnI3: UIButton!
    @IBOutlet weak var btnS: UIButton!
    @IBOutlet weak var btnM: UIButton!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var btnH: UIButton!
    struct variables{
        static var defaultColor: UIColor!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        variables.defaultColor = btnClose.currentTitleColor
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createString()->String{
        var endString = ""
        return endString
    }
    
    @IBAction func toggledBtn(_ sender: UIButton) {
        if(sender.currentTitleColor == UIColor.gray){
            sender.setTitleColor(variables.defaultColor, for: UIControl.State.normal)
        }else{
            sender.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        }
    }
    func initialize(){
        btnF.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btnN.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btnE2.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btnR2.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btnR3.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btnI3.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btnS.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btnM.setTitleColor(UIColor.gray, for: UIControl.State.normal)
        btnH.setTitleColor(UIColor.gray, for: UIControl.State.normal)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
