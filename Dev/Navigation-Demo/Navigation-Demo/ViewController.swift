//
//  ViewController.swift
//  Navigation-Demo
//
//  Created by Weida Xu on 2017/8/9.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //---------------------------------------------------------------
    //                      导航控制器用法
    //---------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 底色
        self.view.backgroundColor = UIColor.darkGray
        
        // 導覽列標題
        self.title = "Top"
        
        // 導覽列底色
        self.navigationController?.navigationBar.barTintColor =
            UIColor.lightGray
        
        // 導覽列是否半透明
        self.navigationController?.navigationBar.isOpaque = false
        
        // 導覽列左邊按鈕
        let leftButton = UIBarButtonItem(
            title: "check",
            //image: UIImage(named:"check"),
            style:.plain ,
            target:self ,
            action: #selector(ViewController.check))
        // 加到導覽列中
        self.navigationItem.leftBarButtonItem = leftButton
        
        // 導覽列右邊按鈕
        let rightButton = UIBarButtonItem(
            title:"Setting",
            style:.plain,
            target:self,
            action:#selector(ViewController.setting))
        // 加到導覽列中
        self.navigationItem.rightBarButtonItem = rightButton
        
        // 建立一個按鈕
        let myButton = UIButton(frame: CGRect(
            x: 0, y: 100, width: 120, height: 40))
        myButton.setTitle("Article", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(
            self, 
            action: #selector(ViewController.article),
            for: UIControlEvents.touchUpInside)
        self.view.addSubview(myButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func article() {
        self.navigationController?.pushViewController(
            ArticleViewController(), animated: true)
    }
    
    func check() {
        print("check button action")
    }
    
    func setting() {
        self.navigationController?.pushViewController(
            SettingViewController(), animated: true)
    }

}

