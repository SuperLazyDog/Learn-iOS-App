//
//  FrameworksTopViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/5/5.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class FrameworksTopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBAction func backToFrameworksTop(segue: UIStoryboardSegue) {
		print("back to \(#function)")
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
