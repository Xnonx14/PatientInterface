//
//  SOBViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 1/8/17.
//  Copyright © 2017 KayGames. All rights reserved.
//

import UIKit

class SOBViewController: UIViewController {

    @IBOutlet weak var SOBsegment: UISegmentedControl!
    struct variables{
        static var SOBString = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func createSOBString()->String{
        var endString = ""
        if(SOBsegment.selectedSegmentIndex == 0){
            endString = "SOB at rest"
        }else{
            endString = "SOB with exertion"
        }
        variables.SOBString = endString
        return endString
    }
    func getView()->UIView{
        return self.view
    }
    @IBAction func closeButtonTapped(_ sender: Any) {
        ReturningViewController.variables.currentInstance.closeWindows()
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
