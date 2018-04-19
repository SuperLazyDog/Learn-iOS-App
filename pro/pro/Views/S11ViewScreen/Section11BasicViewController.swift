//
//  S11BasicViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/18.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class Section11BasicViewController: UIViewController {
	
	@IBOutlet weak var topAreaView: TopAreaView!
	@IBOutlet weak var middleScrollView: UIScrollView!
	@IBOutlet weak var middleTableView: MiddleTableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		let styleDrawing = StartScreenDrawing.init(target: self)
		styleDrawing.drawViewController()
		//----------------------------------------------------------
		// 			      通过程序代码创建view
		//----------------------------------------------------------
		topAreaView.createSubViewWith(color: .yellow)
		//----------------------------------------------------------
		// 				   设置UIScrollView
		//----------------------------------------------------------
		// 可以通过autoLayout自动设定contentSize
		middleScrollView.contentSize = CGSize.init(width: 1000, height: 1000)
		print("contentSize: \(middleScrollView.contentSize)")
//		middleScrollView.scrollRectToVisible(CGRect.init(x: 100, y: 100, width: 0, height: 50), animated: true)
		middleScrollView.scrollsToTop = true
		
		//----------------------------------------------------------
		//                   创建tableView
		//----------------------------------------------------------
		middleTableView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	private var items: [Int: Array<String>]? = nil
	private let defaultItems: [Int: Array<String>] = [1: ["sampleData 1", "sampleData 2", "sampleData 3"]]
	private var reuseIdentifier: String? = nil
}

extension Section11BasicViewController : UITableViewDataSource {
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
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// 必须，返回每个session的行数
		let rows = self.getItems()[section+1]?.count ?? 0
		return rows
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		// 必须, 返回每行的cell
		
		let items = self.getItems()
		if let reuseIdentifier = self.reuseIdentifier {
			let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
			cell.textLabel?.text = items[indexPath.section+1]?[indexPath.row] ?? "error"
			return cell
		} else { // 没有reuseIdentifier就新建cell
			let cell = MiddleTableViewCell.init(style: .default, reuseIdentifier: nil)
			cell.textLabel?.text = items[indexPath.section+1]?[indexPath.row] ?? "error"
			return cell
		}
	}
}
