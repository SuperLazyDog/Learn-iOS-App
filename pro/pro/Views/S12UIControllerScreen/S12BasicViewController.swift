//
//  Section11BasicViewControllerBasicViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/21.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class Section12BasicViewController: UIViewController {
	// UITextFiled Area 右1
	@IBOutlet weak var textFieldMirror: UILabel!
	
	// UISegmentField Area 左2
	@IBOutlet weak var left2AreaMirror: UILabel!
	
	// 右2
	@IBOutlet weak var right2AreaMirror: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
	// 						 左 1
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
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	
}
