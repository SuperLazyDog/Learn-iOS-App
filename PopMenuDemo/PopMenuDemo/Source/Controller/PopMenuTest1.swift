//
//  PopMenuTest1.swift
//  PopMenuDemo
//
//  Created by Weida Xu on 2017/8/8.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit
import SwiftPopMenu
//import SlideMenuControllerSwift

class PopMenuTest1: UIViewController {
    //------------------------------------------------------
    //                       属性
    //------------------------------------------------------
    @IBOutlet var testBut_1: UIView!
    var popMenu:SwiftPopMenu! = nil
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
    @IBAction func popUP(_ sender: UIButton, forEvent event: UIEvent) {
        
       /* popMenu = SwiftPopMenu(frame:  CGRect(x: 0, y: 51, width: 150, height: 112), arrowMargin: 12)
        popMenu.popData = [(icon:"saoyisao",title:"扫一扫"),
                           (icon:"SignRule",title:"签到规则")]
        //点击菜单
        popMenu.didSelectMenuBlock = { [weak self](index:Int)->Void in
            self?.popMenu.dismiss()
            print("block select \(index)")
            
        }
        popMenu.show()*/
        
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
