//
//  ViewController.swift
//  Learning-MultiThread
//
//  Created by Weida Xu on 2017/8/29.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = UIColor.green
        activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.center = self.view.center
        activityIndicatorView.startAnimating()
        
        // Do any additional setup after loading the view, typically from a nib.
        //----------------------------------------------------------------------
        //                              异步处理
        //----------------------------------------------------------------------
        print("//----------------------------------------------------------------------")
        print("//                              异步处理")
        print("//----------------------------------------------------------------------")
        for i in 1...100 {
            DispatchQueue.global().async {
                print(i)
            }
        }
        print("猜猜我在哪里")
        //sleep(2)
        //----------------------------------------------------------------------
        //                              同步处理
        //----------------------------------------------------------------------
        print("//----------------------------------------------------------------------")
        print("//                              同步处理")
        print("//----------------------------------------------------------------------")
        for i in 1...100 {
            DispatchQueue.global().sync {
                print(i)
            }
        }
        print("猜猜我在哪里")
        
        //----------------------------------------------------------------------
        //                              异步串联
        //----------------------------------------------------------------------
        print("//----------------------------------------------------------------------")
        print("//                              异步串联")
        print("//----------------------------------------------------------------------")
        let serialQueue = DispatchQueue(label: "0.1.sample")
        for i in 1...100 {
            serialQueue.async {
                print(i)
            }
        }
        print("猜猜我在哪里")
        //----------------------------------------------------------------------
        //                              同步串联
        //----------------------------------------------------------------------
        print("//----------------------------------------------------------------------")
        print("//                              同步串联")
        print("//----------------------------------------------------------------------")
        for i in 1...100 {
            serialQueue.sync {
                print(i)
            }
        }
        print("猜猜我在哪里")
        
        serialQueue.sync {
            //sleep(2)
        }
        serialQueue.sync {
            print("sleeped")
        }
        
        
//        var formatter = DateFormatter()
//        let jaLocale = Locale(identifier: "ja_JP")
//        formatter.locale = jaLocale
        
//        formatter.dateFormat = "yyyy年MM月dd日 HH時mm分"
//        
//        if let theDate = formatter.date(from: "2016年09月15日 20時45分") {
//            print(theDate.description(with: jaLocale)) // 2016年9月15日木曜日 20時45分00秒 日本標準時
//        } else {
//            print("日付に変換できません")
//        }
//        //2017-08-28T14:26:37.000+09:00
//        formatter.dateFormat = "yyyy-MM-DD"
//        if let theDate = formatter.date(from: "2017-08-28") {
//            print(theDate.description(with: jaLocale)) // 2016年9月15日木曜日 20時45分00秒 日本標準時
//        } else {
//            print("日付に変換できません")
//        }
        
        let group = DispatchGroup()
        for i in 1...100 {
            DispatchQueue.global().async(group: group) {
                print(i)
            }
        }
        let _ = group.wait(timeout: .distantFuture)
        print("猜猜我在哪里")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

