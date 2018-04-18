//
//  StartScreenDrawing.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/19.
//  Copyright © 2018年 Weida. All rights reserved.
//

import Foundation
import UIKit

class StartScreenDrawing {
	private let controller: Section11BasicViewController
	
	init(target: Section11BasicViewController) {
		self.controller = target
	}
	
	func drawViewController() -> Void {
		drawTopAreaView(topAreaView: controller.topAreaView)
	}
	
	private func drawTopAreaView(topAreaView: TopAreaView) -> Void {
		topAreaView.backgroundColor = UIColor.red
	}
}
