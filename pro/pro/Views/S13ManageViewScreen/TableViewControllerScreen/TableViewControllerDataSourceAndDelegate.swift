//
//  TableViewControllerDataSourceAndDelegate.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/30.
//  Copyright © 2018年 Weida. All rights reserved.
//

import Foundation
import UIKit

extension TableViewController { // UITableViewDataSource
//	var defaultData: [[String]] {
//		get {
//			return [["a", "b", "c"], ["k"]]
//		}
//		set {
//			self.defaultData = newValue
//		}
//	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		// section数量
		return self.defaultData.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// section的row数量
		return self.defaultData[section].count
	}
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// 每一个具体的row的cell
		let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewControllerCell", for: indexPath) as! TableViewCell
		cell.textLabel?.text = self.defaultData[indexPath.section][indexPath.row]
		cell.testButton.setTitle(self.defaultData[indexPath.section][indexPath.row], for: .normal)
		return cell
	}
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		// 是否可编辑
		// Return false if you do not want the specified item to be editable.
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		// 编辑row
		if editingStyle == .delete {
			self.defaultData[indexPath.section].remove(at: indexPath.row) // 从数据源删除数据
			// Delete the row from the data source
			tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
}

extension TableViewController { // UITableViewDelegate
}
