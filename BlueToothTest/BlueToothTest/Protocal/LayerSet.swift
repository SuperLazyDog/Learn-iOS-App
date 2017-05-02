//
//  LaySet.swift
//  MoleBattle
//
//  Created by engjo on 2017/03/31.
//  Copyright © 2017年 engjo. All rights reserved.
//
import UIKit
import Foundation
//ボタンの見た目を設定できるプロトコル
protocol LayerSet {
    //-----------------CGColorの色--------------------------------
    
    //-----------------borderを設定する----------------------------
    var normalWidthInIpad: CGFloat { get }
    var normalWidthInIpone: CGFloat { get }
    func setBorder(_ label: UILabel, _ color: CGColor, _ width: CGFloat)
    func setBorder(_ button: UIButton, _ color: CGColor, _ width: CGFloat)
    //------------------丸いコーナーを設定する-----------------------
    func setRadioCorner(_ label: UILabel, _ cornerRadius: CGFloat)
    func setRadioCorner(_ button: UIButton, _ cornerRadius: CGFloat)
    func setRoundCorner(_ label: UILabel)
    func setRoundCorner(_ button: UIButton)
    //------------------backgroud-colorを設定する------------------
    func setBackgroundColor(_ label: UILabel, _ color: CGColor)
    func setBackgroundColor(_ button: UIButton, _ color: CGColor)
    
}

//-----------------CGColorの色--------------------------------
extension LayerSet {
    var cgWhite: CGColor {
        return UIColor.white.cgColor
    }
    var cgBlack: CGColor
    {
        return UIColor.black.cgColor
    }
    var cgBule: CGColor {
        return UIColor.blue.cgColor
    }
    var cgBrown: CGColor {
        return UIColor.brown.cgColor
    }
    var cgClear: CGColor {
        return UIColor.clear.cgColor
    }
    var cgCyan: CGColor {
        return UIColor.cyan.cgColor
    }
    var cgDarkGray: CGColor {
        return UIColor.darkGray.cgColor
    }
    var cgDarkTest: CGColor {
        return UIColor.darkText.cgColor
    }
    var cgGray: CGColor {
        return UIColor.gray.cgColor
    }
    var cgGreem: CGColor {
        return UIColor.green.cgColor
    }
    var cgLightGreen: CGColor {
        return UIColor.lightGray.cgColor
    }
    var cgLightText: CGColor {
        return UIColor.lightText.cgColor
    }
    var cgMagenta: CGColor {
        return UIColor.magenta.cgColor
    }
    var cgOrange: CGColor {
        return UIColor.orange.cgColor
    }
    var cgPurper: CGColor {
        return UIColor.purple.cgColor
    }
    var cgRed: CGColor {
        return UIColor.red.cgColor
    }
}
//-----------------------------------------------------------

//-----------------borderを設定する----------------------------
extension LayerSet {  //border
    var normalWidthInIpad: CGFloat {
        return 4
    }
    var normalWidthInIpone: CGFloat {
        return 2
    }
    //label
    func setBorder(_ label: UILabel, _ color:CGColor, _ width: CGFloat) {
        label.layer.borderWidth = width;
        label.layer.borderColor = color;
    }
    //button
    func setBorder(_ button: UIButton, _ color:CGColor, _ width: CGFloat) {
        button.layer.borderWidth = width;
        button.layer.borderColor = color;
    }
    //textView
    //button
    func setBorder(_ textView: UITextView, _ color:CGColor, _ width: CGFloat) {
        textView.layer.borderWidth = width;
        textView.layer.borderColor = color;
    }
}
//-----------------------------------------------------------


//-----------------背景色を設定する----------------------------
extension LayerSet { //backgroud-colorを設定する
    //label
    func setBackgroundColor(_ label: UILabel, _ color: CGColor) {
        label.layer.backgroundColor = color;
    }
    //button
    func setBackgroundColor(_ button: UIButton, _ color: CGColor) {
        button.layer.backgroundColor = color;
    }
}
//------------------丸いコーナーを設定する-----------------------
extension LayerSet {
    func setRadioCorner(_ label: UILabel, _ cornerRadius: CGFloat) {
        label.layer.masksToBounds = true
        label.layer.cornerRadius = cornerRadius
    }
    func setRadioCorner(_ button: UIButton, _ cornerRadius: CGFloat) {
        button.layer.masksToBounds = true
        button.layer.cornerRadius = cornerRadius
    }
    func setRoundCorner(_ label: UILabel) {
        let frame = label.layer.frame
        if frame.width == frame.height {
            label.layer.masksToBounds = true
            label.layer.cornerRadius = frame.width/2
        }
    }
    func setRoundCorner(_ button: UIButton) {
        let frame = button.layer.frame
        if frame.width == frame.height {
            button.layer.masksToBounds = true
            button.layer.cornerRadius = frame.width/2
        }
    }
}

