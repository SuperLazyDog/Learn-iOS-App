//
//  TopAreaView.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/19.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class TopAreaView: UIView {
	
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	
	func createSubViewWith(color: UIColor) {
		let viewByCode = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
		viewByCode.backgroundColor = color
		self.addSubview(viewByCode)
	}

}
