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
	@IBOutlet weak var bottomCollectionView: BottomCollectionView!
	
	let middleTableViewDataSource = MiddleTableViewDataSource.init(items: [0: ["a", "b", "c"]])
	let middleTableViewDelegate: MiddleTableViewDelegate? = nil
	let bottomCollectionViewHelper = BottomCollectionViewDataSourceAndDelegate.init()
	
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
//		print("contentSize: \(middleScrollView.contentSize)")
//		middleScrollView.scrollRectToVisible(CGRect.init(x: 100, y: 100, width: 0, height: 50), animated: true)
		middleScrollView.scrollsToTop = true
		
		//----------------------------------------------------------
		//                   创建tableView
		//----------------------------------------------------------
		middleTableViewDataSource.setItems(items: [0: ["?", "??", "???"], 1: ["second"]])
//		middleTableView.register(MiddleTableViewCell.self, forCellReuseIdentifier: "sample")
		middleTableViewDataSource.setReuseIdentifier(name: "MiddleTableViewCell")
		middleTableView.setDataSourceAndDelegate(dataSource: middleTableViewDataSource, delegate: middleTableViewDelegate)
//		middleTableViewDataSource.setTitles(titles: ["one", "two"]) // 采用这行, 则显示cell的header, footer
		//----------------------------------------------------------
		//                   创建collectionView
		//----------------------------------------------------------
		let reuseIdentifier = "BottomCollectionViewCell"
//		bottomCollectionView.register(BottomCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		bottomCollectionViewHelper.setReuseIdentifier(name: reuseIdentifier)
		bottomCollectionView.setDataSourceAndDelegate(dataSource: bottomCollectionViewHelper, delegate: bottomCollectionViewHelper)
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
