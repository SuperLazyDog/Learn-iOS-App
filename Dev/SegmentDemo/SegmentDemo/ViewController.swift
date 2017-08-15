//
//  ViewController.swift
//  SegmentDemo
//
//  Created by Weida Xu on 2017/8/15.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            colorView.backgroundColor = UIColor.black
        case 1:
            colorView.backgroundColor = UIColor.blue
        case 3:
            colorView.backgroundColor = UIColor.red
        default:
            colorView.backgroundColor = UIColor.orange
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

