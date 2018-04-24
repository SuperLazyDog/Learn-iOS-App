//
//  Section11BasicViewControllerBasicViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/21.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit
import WebKit

// TODO: 补充12.13 UIBarButtonItem

class Section12BasicViewController: UIViewController {
	// UITextFiled Area 右1
	@IBOutlet weak var textFieldMirror: UILabel!
	
	// UISegmentField Area 左2
	@IBOutlet weak var left2AreaMirror: UILabel!
	
	// 右2
	@IBOutlet weak var right2AreaMirror: UILabel!
	
	// 左3
	@IBOutlet weak var activityIndicatorView: UIActivityIndicatorView! // activityIndicatorView
	@IBOutlet weak var progressView: UIProgressView!
	
	// 右3
	@IBOutlet var right3AreaMirrors: [UILabel]!
	
	// 左4
	@IBOutlet weak var left4AreaMirror: UILabel!
	
	// 右4
	@IBOutlet weak var right4AreaMirror: UILabel!
	
	// 左5
	@IBOutlet weak var wkWebView: WKWebView!
	@IBOutlet weak var uiWebView: UIWebView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		// 左5
		// wkweb
		let url = URL.init(string: "https://github.com/SuperLazyDog")
		let urlRequset = URLRequest.init(url: url!)
		wkWebView.load(urlRequset)
		uiWebView.loadRequest(urlRequset)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//-------------------------------------------------------------
	// 						 UIButton
	//-------------------------------------------------------------
	// touch up inside
	@IBAction func button1(_ sender: Any) {
		print(sender)
	}
	
	//-------------------------------------------------------------
	// 						 右 1
	//-------------------------------------------------------------
	//------------------------------
	//       UITextField
	//------------------------------
	@IBAction func editDisBegin(_ sender: UITextField) {
		textFieldMirror.text = "begined"
	}
	@IBAction func editingChanged(_ sender: UITextField) {
		textFieldMirror.text = sender.text
	}
	@IBAction func editDidEnd(_ sender: UITextField) {
		// 取消聚焦时呼出
		textFieldMirror.text = "Ended"
		print("editDidEnd")
	}
	@IBAction func touchUpOutside(_ sender: UITextField) {
		sender.resignFirstResponder() // 取消聚焦, 会呼出editDidEnd
		print("touchUpOutside")
	}
	@IBAction func didEndOnExit(_ sender: UITextField) {
		// 按return会呼出
		print("didEndOnExit")
	}
	
	//-------------------------------------------------------------
	// 						 左 2
	//-------------------------------------------------------------
	//------------------------------
	//      UISegmentedControll
	//------------------------------
	@IBAction func UISegmentedControllValueChanged(_ sender: UISegmentedControl) {
		let title = sender.titleForSegment(at: sender.selectedSegmentIndex)
		self.left2AreaMirror.text = title
	}
	//------------------------------
	//         UIStepper
	//------------------------------
	@IBAction func stepperValueChanged(_ sender: UIStepper) {
		self.left2AreaMirror.text = "value: \(Int(sender.value))"
		print("stepperValueChanged")
	}
	
	//-------------------------------------------------------------
	// 						 右 2
	//-------------------------------------------------------------
	//------------------------------
	//          UISwitch
	//------------------------------
	@IBAction func switchValueChanged(_ sender: UISwitch) {
		right2AreaMirror.text = String(sender.isOn)
	}
	//------------------------------
	//          UISlide
	//------------------------------
	@IBAction func slideValueChanged(_ sender: UISlider) {
		right2AreaMirror.text = String(Int(sender.value))
	}
	
	//-------------------------------------------------------------
	// 						 左 3
	//-------------------------------------------------------------
	//------------------------------
	//  控制UIActivityIndicatorView
	//------------------------------
	@IBAction func startOrStopActivityIndicator(_ sender: UIButton) {
		if activityIndicatorView.isAnimating {
			activityIndicatorView.stopAnimating()
			print("停止activityIndicatorView")
		} else {
			activityIndicatorView.startAnimating()
			print("启动activityIndicatorView")
		}
	}
	//------------------------------
	//      控制UIProgressView
	//------------------------------
	@IBAction func addProgress(_ sender: UIButton) {
		self.progressView.progress += 5/100
		print("+ progress: \(self.progressView.progress)")
	}
	
	@IBAction func minusProgress(_ sender: UIButton) {
		self.progressView.progress -= 5/100
		print("- progress: \(self.progressView.progress)")
	}
	
	//-------------------------------------------------------------
	// 						 左 4
	//-------------------------------------------------------------
	//------------------------------
	//     控制UIDatePicker
	//------------------------------
	@IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
		let dateFormatter = DateFormatter.init()
		dateFormatter.dateStyle = .long
		dateFormatter.timeStyle = .long
		self.left4AreaMirror.text = dateFormatter.string(from: sender.date)
	}
	
	//-------------------------------------------------------------
	// 						 右 4
	//-------------------------------------------------------------
	//------------------------------
	//     控制UIPageControl
	//------------------------------
	@IBAction func pageControlValueChanged(_ sender: UIPageControl) {
		self.right4AreaMirror.text = String.init(sender.currentPage)
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
