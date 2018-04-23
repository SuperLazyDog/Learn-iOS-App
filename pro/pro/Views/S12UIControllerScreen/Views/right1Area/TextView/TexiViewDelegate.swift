//
//  TexiViewDelegate.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/23.
//  Copyright © 2018年 Weida. All rights reserved.
//

import Foundation
import UIKit

extension Section12BasicViewController: UITextViewDelegate {
	func textViewDidBeginEditing(_ textView: UITextView) {
		print("textViewDidBeginEditing")
	}
	
	func textViewDidChange(_ textView: UITextView) {
		self.textFieldMirror.text = textView.text
//		print("textViewDidChange")
	}
	
	func textViewDidChangeSelection(_ textView: UITextView) {
		// 改变光标位置, 包括
		// 自己选择
		// 输入或删除字符
//		print("textViewDidChangeSelection")
	}
	
	func textViewDidEndEditing(_ textView: UITextView) {
		print("textViewDidEndEditing")
	}
}
