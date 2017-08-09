//
//  HomeViewController.swift
//  Learning-PureLayout
//
//  Created by Weida Xu on 2017/8/9.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit
import SideMenu
import PureLayout

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*view.backgroundColor = UIColor.white
        
        let label = UILabel();
        label.text = "Test"
        
        view.addSubview(label)
        
        label.autoPinEdge(toSuperviewEdge: .bottom)
        label.autoAlignAxis(toSuperviewAxis: .vertical)*/
        
        // TODO: 怎么用code写Navigation Controller
        // TODO: 实践
        // TODO: 尝试SideMenu
        //---------------------------------------------------------------------
        //                              Side Menu
        //---------------------------------------------------------------------
        // Define the menus
        
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: ViewController())
        menuLeftNavigationController.leftSide = true
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        // let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        let menuRightNavigationController = UISideMenuNavigationController(rootViewController: ViewController())
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        // let menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.menuRightNavigationController = menuRightNavigationController
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
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
