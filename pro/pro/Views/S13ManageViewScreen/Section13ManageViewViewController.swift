//
//  Section13ManageViewViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/25.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit
import SafariServices

class Section13ManageViewViewController: UIViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
	
	@IBAction func backToS13Top(segue: UIStoryboardSegue) {
		print("back to \(#function)")
	}
	//-------------------------------------------------------
	//                       状态栏
	//-------------------------------------------------------
	// 改变样式 .default/.lightContent
	var style = UIStatusBarStyle.default
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return style
	}
	@IBAction func changeStatusBarStyle(_ sender: UIButton) {
		style = ((style == UIStatusBarStyle.default) ? .lightContent : .default)
		setNeedsStatusBarAppearanceUpdate()
	}
	// 切换显示 prefersStatusBarHidden
	var isHidden = false
	override var prefersStatusBarHidden: Bool {
		return isHidden
	}
	
	@IBAction func toggleStatusBar(_ sender: UIButton) {
		isHidden = !isHidden
		setNeedsStatusBarAppearanceUpdate()
	}
	
	// 画面方向
//	override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//		return [.landscapeLeft] // 只支持向左横倾
//	}
	//-------------------------------------------------------
	//                       第4栏
	//-------------------------------------------------------
	@IBAction func shareSelf(_ sender: UIButton) { // 打开其他应用
		let activityController = UIActivityViewController.init(
			activityItems: ["分享"],
			applicationActivities: nil
		)
		present(activityController, animated: true, completion: nil)
	}
	@IBAction func showWebPage(_ sender: UIButton) { // SFSafariWebViewController
		guard let url = URL.init(string: "https://github.com/") else {
			return
		}
		let safariWebViewController = SFSafariViewController.init(url: url)
		present(safariWebViewController, animated: true, completion: nil)
	}
}
