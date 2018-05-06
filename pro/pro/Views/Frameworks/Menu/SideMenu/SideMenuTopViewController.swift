//
//  SideMenuTopViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/5/6.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuTopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		//---------------------------------------------------------
		//						 SideMenu
		//---------------------------------------------------------
		SideMenuManager.default.menuFadeStatusBar = false
		SideMenuManager.default.menuPresentMode = .menuSlideIn//.viewSlideInOut
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
