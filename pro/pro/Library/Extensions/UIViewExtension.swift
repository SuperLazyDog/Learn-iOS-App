//
//  UIViewExtension.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/19.
//  Copyright © 2018年 Weida. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	var instanceName: String { // 自身的变量名
		get {
			let mirror = Mirror(reflecting: self)
			return String(describing: mirror.subjectType)
		}
	}
	
	var customDescription: String { // 自身的自定义属性一览
		get {
			let mirror = Mirror(reflecting: self)
			var customDescription: String
			customDescription = String(describing: mirror.subjectType)
			customDescription += "("
			var isFirst = true
			for case let(label?, value) in mirror.children {
				if !isFirst {
					customDescription += ", "
				}
				customDescription += label
				customDescription += ": "
				let valueMirror = Mirror(reflecting: value)
				customDescription += String(describing: valueMirror.subjectType)
				customDescription += "="
				customDescription += String(describing: value)
				isFirst = false
			}
			customDescription += ")"
			return customDescription
		}
	}
	
	func printSize() {
		let name = self.instanceName
		print("\(name).frams: \(self.frame)")
		print("\(name).bounds: \(self.bounds)")
	}
}
