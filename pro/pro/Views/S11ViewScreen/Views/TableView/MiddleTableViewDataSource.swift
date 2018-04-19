//
//  MiddleTableViewDataSource.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/19.
//  Copyright © 2018年 Weida. All rights reserved.
//

import Foundation
import UIKit

class MiddleTableViewDataSource: NSObject {
	private var items: [Int: Array<String>]? = nil
	private let defaultItems: [Int: Array<String>] = [0: ["sampleData 1", "sampleData 2", "sampleData 3"]]
	private var reuseIdentifier: String? = nil
	
	init(items: [Int: Array<String>]) {
		super.init()
		self.items = items
	}
	
	// items相关设置
	func setItems(items: [Int: Array<String>]) {
		self.items = items
	}
	
	func getItems() -> [Int: Array<String>] {
		return self.items ?? self.defaultItems
	}
	
	// 设置reuesIdentifier
	func setReuseIdentifier(name: String) {
		self.reuseIdentifier = name
	}
}

extension MiddleTableViewDataSource : UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// 必须，返回每个session的行数
		let rows = self.getItems()[section]?.count ?? 0
//		print("session: \(section)")
//		print("self.getItems()?: \(self.getItems())")
//		print("rows: \(rows)")
//		print("------------------")
		return rows
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// 必须, 返回每行的cell
		let items = self.getItems()
		if let reuseIdentifier = self.reuseIdentifier {
			print("in reuseIdentifier: \(reuseIdentifier)") // TODO: delete here
			let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
			cell.textLabel?.text = items[indexPath.section]?[indexPath.row] ?? "error"
			return cell
		} else { // 没有reuseIdentifier就新建cell
			print("in else") // TODO: delete here
			let cell = MiddleTableViewCell.init(style: .default, reuseIdentifier: nil)
			cell.textLabel?.text = items[indexPath.section]?[indexPath.row] ?? "error"
			return cell
		}
	}
}
