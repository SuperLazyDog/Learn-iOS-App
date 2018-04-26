//
//  ViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/3.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func backToStartScreen(segue: UIStoryboardSegue) {
		print("back to \(#function)")
	}
}

