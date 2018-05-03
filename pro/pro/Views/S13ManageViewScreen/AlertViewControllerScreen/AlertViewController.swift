//
//  AlertViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/5/3.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	//----------------------------------------------------------------
	// 							上方Area
	//----------------------------------------------------------------
	@IBAction func showSampleAlert(_ sender: UIButton) {
		let alertController = UIAlertController.init(title: "改变背景颜色", message: "真的要改变吗", preferredStyle: .alert) // 创建UIAlertController
		let cancelAlertButton = UIAlertAction.init(title: "取消", style: .cancel, handler: nil) // 创建取消按钮
		let okAlertButton = UIAlertAction.init(title: "确定", style: .default, handler: { action in
			self.view.backgroundColor = UIColor.red
		}) // 创建确定按钮
		// 添加到alert；里
		alertController.addAction(okAlertButton)
		alertController.addAction(cancelAlertButton)
		// 显示alert
		present(alertController, animated: true, completion: nil)
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
