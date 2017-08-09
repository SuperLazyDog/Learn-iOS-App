//
//  ViewController.swift
//  Learning-PureLayout
//
//  Created by Weida Xu on 2017/8/9.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    let label = UILabel();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = "test"
        
        view.addSubview(label)
        
        label.autoAlignAxis(toSuperviewAxis: .horizontal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

