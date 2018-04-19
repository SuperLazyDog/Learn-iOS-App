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
		let drawing = TopAreaViewDrawing.init(target: topAreaView)
		drawing.draw()
		
	}
}

extension StartScreenDrawing {
	class TopAreaViewDrawing {
		let topAreaView: TopAreaView
		
		init(target: TopAreaView) {
			self.topAreaView = target
		}
		
		func draw() {
			topAreaView.backgroundColor = UIColor.red
			topAreaView.printSize()
		}
		
	}
}
