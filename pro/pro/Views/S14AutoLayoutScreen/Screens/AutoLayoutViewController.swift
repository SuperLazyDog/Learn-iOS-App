//
//  AutoLayoutViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/5/4.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {

	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var saveButtonBottom: NSLayoutConstraint!
	let saveButtonBottomBefore: CGFloat = 9
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	// 保存按钮
	@IBAction func saveAction(_ sender: UIButton) {
		textView.resignFirstResponder()
	}
	
	// 监听键盘相关的方法
	@objc func keyboardWillShow(notification: Notification) {
		print("started \(#function)")
		guard let rect = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
			return
		}
		saveButtonBottom.constant += rect.height
		print("finished \(#function)")
	}
	
	@objc func keyboardWillHide(notification: Notification) {
		print("started \(#function)")
		guard let rect = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
			return
		}
		print("rect: \(rect)")
		saveButtonBottom.constant = saveButtonBottomBefore
		print("finished \(#function)")
	}

}
