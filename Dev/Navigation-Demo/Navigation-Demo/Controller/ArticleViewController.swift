//
//  ArticleViewController.swift
//  Navigation-Demo
//
//  Created by Weida Xu on 2017/8/9.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 底色
        self.view.backgroundColor = UIColor.white
        
        // 導覽列標題
        self.title = "Article"
        
        // 導覽列底色
        self.navigationController?.navigationBar.barTintColor =
            UIColor.cyan
        
        // 導覽列是否半透明
        self.navigationController?.navigationBar.isOpaque = false
        
        // 導覽列右邊按鈕
        let rightButton = UIBarButtonItem(
            barButtonSystemItem: .edit,
            target: self,
            action: #selector(ArticleViewController.edit))
        // 加到導覽列中
        self.navigationItem.rightBarButtonItem = rightButton
        
        // 建立一個按鈕
        let myButton = UIButton(frame: CGRect(
            x: 100, y: 100, width: 120, height: 40))
        myButton.setTitle("back", for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.addTarget(
            self, 
            action: #selector(ArticleViewController.back),
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
    
    func edit() {
        print("edit action")
    }
    
    func back() {
        self.navigationController?.popViewController(animated: true)
    }

}
