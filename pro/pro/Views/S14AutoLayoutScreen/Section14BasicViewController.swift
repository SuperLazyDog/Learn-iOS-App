//
//  Section14BasicViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/5/4.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class Section14BasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// 返回此Controller
	@IBAction func backToS14Top(segue: UIStoryboardSegue) {
		print("back to \(#function)")
	}
	
}
