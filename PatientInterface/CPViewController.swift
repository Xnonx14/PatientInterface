//
//  CPViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 1/8/17.
//  Copyright © 2017 KayGames. All rights reserved.
//

import UIKit

class CPViewController: UIViewController {
    func getView()->CPView{
        return self.view as! CPView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
