//
//  GeneralViewController.swift
//  PatientInterface
//
//  Created by Kevin Chang on 8/19/16.
//  Copyright © 2016 KayGames. All rights reserved.
//

import UIKit

class GeneralViewController: UITabBarController, UITabBarControllerDelegate{

    struct variables{
        static var myController : GeneralViewController!
        static var adminAccess = false
        static var pages: [UIViewController]?
        static var page1: FirstViewController!
        static var page2: Page2ViewController!
        static var page3: Page3ViewController!
        static var page4: MailViewController!
        static var page5: Page5ViewController!
    }
    override func viewDidLoad() {
        variables.myController = self
        super.viewDidLoad()
        variables.pages = self.viewControllers
        variables.page1 =  variables.pages![0] as? FirstViewController
        variables.page2 = variables.pages![1] as? Page2ViewController
        variables.page3 = variables.pages![2] as? Page3ViewController
        variables.page4 = variables.pages![3] as? MailViewController
        variables.page5 = variables.pages![4] as? Page5ViewController
    }
    static func changeView(val: UInt){
        print("swipe")
        print(val)
        print(variables.myController.selectedIndex)
        print(variables.pages!.count - 1)
        if(val == 2 && variables.myController.selectedIndex == (variables.pages!.count - 1)){
            variables.myController.selectedIndex = 0
        }else if(val == 1 && variables.myController.selectedIndex == 0){
            variables.myController.selectedIndex = variables.pages!.count - 1
        }
        else if(val == 1){ // go left
            variables.myController.selectedIndex -= 1
        }
        else if(val == 2){ // go right
            variables.myController.selectedIndex += 1
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func saveComplete(){
        //self.tabBar.items![1].enabled = true
    }
    func notSaved(){
        if(!variables.adminAccess){
            //self.tabBar.items![1].enabled = false
        }
    }
    static func proceed(){
        variables.myController.saveComplete()
    }
    static func prevent(){
        variables.myController.notSaved()
    }
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.delegate = self
//        print(item.title)
//        self.tabBar.items![2].enabled = false
        
    }
}
