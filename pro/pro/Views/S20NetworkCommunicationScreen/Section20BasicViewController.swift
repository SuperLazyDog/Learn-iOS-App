//
//  Section20BasicViewController.swift
//  pro
//
//  Created by 徐伟达 on 2018/6/5.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class Section20BasicViewController: UIViewController {

	@IBOutlet weak var sampleTextView: UITextView!
	
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		startSampleRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
}

//------------------------------------------------------------------------------------
// 						 		 segue action
//------------------------------------------------------------------------------------
extension Section20BasicViewController {
	// unwind segue
	@IBAction func backToS20Top(segue: UIStoryboardSegue) {
		print("back to \(#function)")
	}
}

//------------------------------------------------------------------------------------
// 									action setting
//------------------------------------------------------------------------------------
extension Section20BasicViewController {
	func startSampleRequest() {
		guard let url = URL.init(string: "https://www.baidu.com/") else { return }
		let session = URLSession.shared
		let task = session.dataTask(with: url) { (data, response, error) in
			if error != nil {
				print("error: \(String(describing: error))")
				return
			}
			guard let data = data else { return }
			DispatchQueue.main.async {
				sleep(2) // 为了测试效果, 暂停2秒
				let text = String.init(data: data, encoding: String.Encoding.utf8)
				self.toggleActivityIndicator(target: self.activityIndicator)
				self.sampleTextView.text = text
			}
			
		}
		task.resume()
	}
}

//------------------------------------------------------------------------------------
// 									style setting
//------------------------------------------------------------------------------------
extension Section20BasicViewController {
	private func toggleActivityIndicator(target: UIActivityIndicatorView) {
		if target.isAnimating {
			target.stopAnimating()
		} else {
			target.startAnimating()
		}
	}
}
