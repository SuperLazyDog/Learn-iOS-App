//
//  ExString.swift
//  MoleBattle
//
//  Created by engjo on 2017/03/31.
//  Copyright © 2017年 engjo. All rights reserved.
//

import Foundation
//stringをより使いやすくするための拡張
extension String {
    var length: Int { //文字列の長さ
        return self.characters.count
    }
    var trueEndIndex: Index {//本当の最後の文字のインデックス
        return self.index(before: self.endIndex)
    }
    static var myTurn: String {
        return "あなたのターンです。"
    }
    static var aiTrun: String {
        return "相手のターンです。"
    }
    static var start: String {
        return "さあ、始めましょう!"
    }
    static var yesJa: String {
        return "はい"
    }
    static var yesEn: String {
        return "ok"
    }
    static var noStartGameJa: String {
        return "選び直し"
    }
    static var comScore: String {
        return " COMの得点："
    }
    static var score: String {
        return "点"
    }
    static var nowCombi: String {
        return "nowCombi"
    }
    static var  remain: String {
        return "あと"
    }
    static var sec: String {
        return "秒"
    }
    
    //下付き文字
    //x¹ + x² + x³
    /*
     *UnicodeScalar("¹")?.value = 185
     *UnicodeScalar("²")?.value = 178
     *UnicodeScalar("³")?.value = 179
     */
    static var underNumMin: Int {//一番小さい下付き文字の値
        return Int((UnicodeScalar("\u{2080}")?.value)!)
    }
    static var underNumMAx: Int {//一番大きい下付き文字の値
        return Int((UnicodeScalar("\u{2089}")?.value)!)
    }
    
    static var zeroUnder: String {
        return "\u{2080}"
    }
    static var oneUnder: String {//別
        return "\u{2081}"
    }
    static var twoUnder: String {//別
        return "\u{2082}"
    }
    static var threeUnder: String {//別
        return "\u{2083}"
    }
    static var fourUnder: String {
        return "\u{2084}"
    }
    static var fiveUnder: String {
        return "\u{2085}"
    }
    static var sixUnder: String {
        return "\u{2086}"
    }
    static var sevenUnder: String {
        return "\u{2087}"
    }
    static var eightUnder: String {
        return "\u{2088}"
    }
    static var nineUnder: String {
        return "\u{2089}"
    }
    
    //数字の値の範囲
    static var normalNumMin: Int {  //48
        return Int((UnicodeScalar("0")?.value)!)
    }
    
    static var normalNumMax: Int {  //57
        return Int((UnicodeScalar("9")?.value)!)
    }
    //上付き文字
    static var upperNumMin: Int {//一番小さい上付き文字の値
        return Int((UnicodeScalar("\u{2070}")?.value)!)
    }
    static var upperNumMAx: Int {//一番大きい上付き文字の値
        return Int((UnicodeScalar("\u{2079}")?.value)!)
    }
    static var zeroUpper: String {
        return "\u{2070}"
    }
    static var oneUpper: String {
        return "¹"//"\u{2071}"
    }
    static var twoUpper: String {
        return "²"//"\u{2072}"
    }
    static var threeUpper: String {
        return "³"//"\u{2073}"
    }
    static var fourUpper: String {
        return "\u{2074}"
    }
    static var fiveUpper: String {
        return "\u{2075}"
    }
    static var sixUpper: String {
        return "\u{2076}"
    }
    static var sevenUpper: String {
        return "\u{2077}"
    }
    static var eightUpper: String {
        return "\u{2078}"
    }
    static var nineUpper: String {
        return "\u{2079}"
    }
    
}

//上付き数字の配列
let numUpperArray: [String] = [String.zeroUpper, String.oneUpper, String.twoUpper, String.threeUpper, String.fourUpper, String.fiveUpper, String.sixUpper, String.sevenUpper, String.eightUpper, String.nineUpper]

//下付き数字の配列
let numUnderArray: [String] = [String.zeroUnder, String.oneUnder, String.twoUnder, String.threeUnder, String.fourUnder, String.fiveUnder, String.sixUnder, String.sevenUnder, String.eightUnder, String.nineUnder]
