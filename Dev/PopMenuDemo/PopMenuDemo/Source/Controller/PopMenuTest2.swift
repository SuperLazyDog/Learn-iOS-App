//
//  PopMenuTest2.swift
//  PopMenuDemo
//
//  Created by Weida Xu on 2017/8/8.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit
import SwiftPopMenu
import SideMenu

//主画面
class PopMenuTest2: UIViewController {
    //------------------------------------------------------
    //                       属性
    //------------------------------------------------------
    
    //------------------------------------------------------
    //                       内部函数
    //------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //------------------------------------------------------
    //                       按钮事件
    //------------------------------------------------------
    
    @IBAction func setButton1(_ sender: UIButton, forEvent event: UIEvent) {
        SideMenuManager.menuWidth = max(round(min((UIScreen.main.bounds.width), (UIScreen.main.bounds.height)) * 0.3), 240)
        SideMenuManager.menuPresentMode = .menuSlideIn
    }
    
    @IBAction func setButton2(_ sender: UIButton, forEvent event: UIEvent) {
        SideMenuManager.menuWidth = min((UIScreen.main.bounds.width), (UIScreen.main.bounds.height)) * 0.5
        SideMenuManager.menuPresentMode = .viewSlideInOut
    }
    
    @IBAction func setButton3(_ sender: UIButton, forEvent event: UIEvent) {
        SideMenuManager.menuWidth = min((UIScreen.main.bounds.width), (UIScreen.main.bounds.height)) * 0.5
        SideMenuManager.menuPresentMode = .menuDissolveIn
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
