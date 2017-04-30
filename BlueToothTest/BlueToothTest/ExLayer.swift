//
//  ExLayer.swift
//  BlueToothTest
//
//  Created by 徐伟达 on 2017/4/30.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {
    func setBoder(color: UIColor, thickness: Double) {
        self.borderColor = color.cgColor
        self.borderWidth = CGFloat(thickness)
    }
}

var normalThickness: Double {
    return 2.0
}
