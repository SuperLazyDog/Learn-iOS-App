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
	var defaultData: [[String]] {
		return [["a", "b", "c"], ["k"]]
	}
	
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
		let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewControllerCell", for: indexPath)
		cell.textLabel?.text = self.defaultData[indexPath.section][indexPath.row]
		return cell
	}
}

extension TableViewController { // UITableViewDelegate
	
}
