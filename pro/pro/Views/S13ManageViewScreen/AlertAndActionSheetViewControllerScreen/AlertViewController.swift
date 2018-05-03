//
//  AlertAndActionSheetViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/5/3.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class AlertAndActionSheetViewController: UIViewController {

	@IBOutlet weak var actionSheetMirror: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	//----------------------------------------------------------------
	// 						  Alert Area
	//----------------------------------------------------------------
	// 左1
	@IBAction func showSampleAlert(_ sender: UIButton) {
		// 创建UIAlertController
		let alertController = UIAlertController.init(title: "改变背景颜色", message: "真的要改变吗", preferredStyle: .alert)
		// 创建取消按钮
		let cancelAlertButton = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
		// 创建确定按钮
		let okAlertButton = UIAlertAction.init(title: "确定", style: .default, handler: { action in
			self.view.backgroundColor = UIColor.red
		})
		// 添加到alert里
		alertController.addAction(okAlertButton)
		alertController.addAction(cancelAlertButton)
		// 显示alert
		present(alertController, animated: true, completion: nil)
	}
	//----------------------------------------------------------------
	// 					 Action Sheet Area (动作菜单)
	//----------------------------------------------------------------
	// 左1
	@IBAction func showSampleActionSheet(_ sender: UIButton) {
		// 创建UIAlertController
		let alertController = UIAlertController.init(title: "动作菜单", message: "随便选一个啊", preferredStyle: .actionSheet)
		// 创建选项1, 2, 3
		let firstAction = UIAlertAction.init(title: "随意", style: .default, handler: { action in
			self.actionSheetMirror.text = "选了【随意】"
		})
		let secondAction = UIAlertAction.init(title: "干", style: .destructive) { (action) in
			self.actionSheetMirror.text = "选了【干】"
		}
		let thirdAction = UIAlertAction.init(title: "取消", style: .cancel) { (action) in
			self.actionSheetMirror.text = "选了【取消】"
		}
		// 添加到action sheet
		alertController.addAction(firstAction)
		alertController.addAction(secondAction)
		alertController.addAction(thirdAction)
		// 显示action sheet
		present(alertController, animated: true)
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
