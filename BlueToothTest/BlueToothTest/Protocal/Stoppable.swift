//
//  Stoppable.swift
//  MoleBattle
//
//  Created by engjo on 2017/04/08.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation

/*class Stoppable {
    init(interval: Double, repeats: Bool) {
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(stop), userInfo: nil, repeats: repeats)
    }
    
    @objc func stop() {
        
    }
}*/
//使わない
protocol Stoppable: class {
    func stop()
}

extension Stoppable {
    func stop() {
    }
}
