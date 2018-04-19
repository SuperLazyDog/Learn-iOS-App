//
//  MiddleTableView.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/19.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class MiddleTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	
	func setDataSourceAndDelegate(dataSource: UITableViewDataSource?, delegate: UITableViewDelegate?) {
		print("setDataSourceAndDelegate")
		self.dataSource = dataSource ?? nil
		self.delegate = delegate ?? nil
	}
}
