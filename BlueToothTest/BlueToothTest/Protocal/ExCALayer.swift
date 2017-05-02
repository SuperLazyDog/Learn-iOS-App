//
//  ExCALayer.swift
//  MoleBattle
//
//  Created by engjo on 2017/03/31.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation
import UIKit

//良くない、次回または時間があるときにautoLayoutに対応するように修正する必要がある
//今のままだと、autoLayoutによってサイズが調整されても元のところにボーダーを描画することになる
extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect.init(x: 0, y: 0, width: thickness, height: frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect.init(x: frame.width - thickness, y: 0, width: thickness, height: frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
}
