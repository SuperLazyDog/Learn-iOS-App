//
//  ViewController.swift
//  Learning-View
//
//  Created by Weida Xu on 2017/8/15.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //---------------------------------------------------------------------
        //                         创建并展示label
        //---------------------------------------------------------------------
        //创建label
        let label = UILabel()
        label.text = " 这是一个标签"
        
        //设置
        label.frame = CGRect(x: 20, y: 20, width: 200, height: 50) //位置大小
        label.backgroundColor = UIColor.orange //背景颜色
        label.textColor = UIColor.blue // 字体颜色
        
        //添加到主视图里去
        self.view.addSubview(label)
        
        //---------------------------------------------------------------------
        //                      在子视图内部创建并展示label
        //---------------------------------------------------------------------
        //创建子视图
        let subView = UIView()
        //设置
        subView.frame = CGRect(x: 20, y: 80, width: 200, height: 200) //位置大小
        subView.backgroundColor = UIColor.gray //背景颜色
        
        // 创建位于自视图内部的label
        let subLable = UILabel()
        subLable.text = "这是子标签"
        //设置
        subLable.frame = CGRect(x: 0, y: 0, width: 100, height: 100)  //位置大小
        subLable.backgroundColor = UIColor.brown //背景颜色
        subLable.textColor = UIColor.white // 字体颜色
        //添加到子视图里去
        subView.addSubview(subLable)
        let testButton = UIButton()
        testButton.frame = CGRect(x: 0, y: 100, width: 100, height: 50)
        testButton.setTitle("testButton", for: .normal)
        testButton.backgroundColor = UIColor.red
        subView.addSubview(testButton)
        //添加到主视图里去
        self.view.addSubview(subView)
        
        //---------------------------------------------------------------------
        //                           添加ImageView
        //---------------------------------------------------------------------
        //创建imageView
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "myImage")
        //设置
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 20, y: 300, width: 200, height: 200)
        //添加到子视图里去
        self.view.addSubview(imageView)
        
        
        //---------------------------------------------------------------------
        //                          这里添加导航栏?
        //---------------------------------------------------------------------
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

