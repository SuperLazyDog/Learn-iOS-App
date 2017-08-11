//
//  SettingViewController.swift
//  Navigation-Demo
//
//  Created by Weida Xu on 2017/8/9.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 底色
        self.view.backgroundColor = UIColor.orange
        
        // 導覽列標題
        self.title = "Setting"
        
        // 導覽列底色
        self.navigationController?.navigationBar.barTintColor =
            UIColor.white
        
        // 導覽列是否半透明
        self.navigationController?.navigationBar.isOpaque = false
        
        // 導覽列右邊 UIView
        let myUIView = UIView(frame: CGRect(
            x: 0, y: 0, width: 30, height: 30))
        myUIView.backgroundColor = UIColor.purple
        let rightButton = UIBarButtonItem(customView: myUIView)
        // 加到導覽列中
        self.navigationItem.rightBarButtonItem = rightButton
        
        // 建立一個按鈕
        let myButton = UIButton(frame: CGRect(
            x: 100, y: 250, width: 120, height: 40))
        myButton.setTitle("back", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(
            self, 
            action: #selector(SettingViewController.back),
            for: UIControlEvents.touchUpInside)
        self.view.addSubview(myButton)
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
    
    func back() {
        self.navigationController?.popViewController(animated: true)
        
    }
}
