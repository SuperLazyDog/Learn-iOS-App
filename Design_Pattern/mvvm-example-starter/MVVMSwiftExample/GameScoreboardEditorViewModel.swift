//
//  GameScoreboardEditorViewModel.swift
//  MVVMSwiftExample
//
//  Created by 徐伟达 on 2018/4/5.
//  Copyright © 2018年 Toptal. All rights reserved.
//

import Foundation

protocol GameScoreboardEditorViewModel {
	var homeTeam: String { get }
	var awayTeam: String { get }
	var time: String { get }
	var score: String { get }
	var isFinished: Bool { get }
	var homePlayers: [PlayerScoreboardMoveEditorViewModel] { get }
	var awayPlayers: [PlayerScoreboardMoveEditorViewModel] { get }
	
	var isPaused: Bool { get }
	func togglePause();
}
