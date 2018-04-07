//
//  PlayerScoreboardMoveEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by 徐伟达 on 2018/4/5.
//  Copyright © 2018年 Toptal. All rights reserved.
//

import Foundation

protocol PlayerScoreboardMoveEditorViewModel {
	var playerName: String { get }
	
	var onePointMoveCount: String { get }
	var twoPointMoveCount: String { get }
	var assistMoveCount: String { get }
	var reboundMoveCount: String { get }
	var foulMoveCount: String { get }
	
	func onePointMove()
	func twoPointsMove()
	func assistMove()
	func reboundMove()
	func foulMove()
}
