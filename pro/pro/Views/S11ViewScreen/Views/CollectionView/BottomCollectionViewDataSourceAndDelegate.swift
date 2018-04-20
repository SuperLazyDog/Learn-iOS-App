//
//  BottomCollectionViewDataSourceAndDelegate.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/20.
//  Copyright © 2018年 Weida. All rights reserved.
//

import Foundation
import UIKit

class BottomCollectionViewDataSourceAndDelegate: NSObject {
	private var datas: [String]? = nil
	private let defaultDatas = ["A", "B", "C", "D", "E", "F", "G"]
	private var reuseIdentifier: String? = nil
	
	// 设置与获取datas
	func setDatas(datas: [String]?) {
		self.datas = datas
	}
	
	func getDatas() -> [String] {
		return self.datas ?? defaultDatas
	}
	
	// 设置与获取reuseIdentifier
	func setReuseIdentifier(name: String) {
		self.reuseIdentifier = name
	}
	
}

extension BottomCollectionViewDataSourceAndDelegate: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.getDatas().count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier!, for: indexPath)
		return cell
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 2
	}
}

extension BottomCollectionViewDataSourceAndDelegate: UICollectionViewDelegate {
	
}
