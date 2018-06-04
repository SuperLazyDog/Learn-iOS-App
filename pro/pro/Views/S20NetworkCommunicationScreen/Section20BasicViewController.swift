//
//  Section20BasicViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/6/5.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class Section20BasicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
}

//------------------------------------------------------------------------------------
// 						 		 segue action
//------------------------------------------------------------------------------------
extension Section20BasicViewController {
	// unwind segue
	@IBAction func backToS20Top(segue: UIStoryboardSegue) {
		print("back to \(#function)")
	}
}

//------------------------------------------------------------------------------------
// 									action setting
//------------------------------------------------------------------------------------
extension Section20BasicViewController {

}

//------------------------------------------------------------------------------------
// 									style setting
//------------------------------------------------------------------------------------
extension Section20BasicViewController {
	
}
