//
//  PickerViewDataSourceAndDelegate.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/24.
//  Copyright © 2018年 Weida. All rights reserved.
//

import Foundation
import UIKit

extension Section12BasicViewController: UIPickerViewDataSource {
	var pickViewData: [[String]] {
		return [
			["1-1", "1-2", "1-3"],
			["2-1", "2-2", "2-3"]
		]
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return self.pickViewData.count
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return self.pickViewData[component].count
	}
}

extension Section12BasicViewController: UIPickerViewDelegate {
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return self.pickViewData[component][row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		self.right3AreaMirrors[component].text = self.pickViewData[component][row]
	}
}
