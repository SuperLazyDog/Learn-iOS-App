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
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let styleDrawing = StartScreenDrawing.init(target: self)
		styleDrawing.drawViewController()
		// 通过程序代码创建view
		topAreaView.createSubViewWith(color: .yellow)
		
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

}
