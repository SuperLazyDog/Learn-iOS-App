//
//  BottomCollectionView.swift
//  pro
//
//  Created by 徐伟达 on 2018/4/20.
//  Copyright © 2018年 Weida. All rights reserved.
//

import UIKit

class BottomCollectionView: UICollectionView {

	func setDataSourceAndDelegate(dataSource: UICollectionViewDataSource?, delegate: UICollectionViewDelegate?) {
		self.dataSource = dataSource
		self.delegate = delegate
	}
}
