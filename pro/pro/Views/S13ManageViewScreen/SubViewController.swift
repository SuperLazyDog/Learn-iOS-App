//
//  SubViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/26.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
	
	func lifeCycleDebugTest(string: String) {
		print("now in \(string)")
	}
	// 生命周期测试
    override func viewDidLoad() {
        super.viewDidLoad()
		lifeCycleDebugTest(string: #function)
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		lifeCycleDebugTest(string: #function)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		lifeCycleDebugTest(string: #function)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		lifeCycleDebugTest(string: #function)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		lifeCycleDebugTest(string: #function)
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		lifeCycleDebugTest(string: #function)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		lifeCycleDebugTest(string: #function)
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		lifeCycleDebugTest(string: #function)
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

}
