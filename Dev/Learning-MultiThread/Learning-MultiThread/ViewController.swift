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
        sleep(2)
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
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

