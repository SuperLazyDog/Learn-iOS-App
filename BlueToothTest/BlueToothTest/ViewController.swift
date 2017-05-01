//
//  ViewController.swift
//  BlueToothTest
//
//  Created by 徐伟达 on 2017/4/30.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate {
    //----------------------------------------------------------------------
    //                             プロパティ
    //----------------------------------------------------------------------
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral!
    //----------------------------------------------------------------------
    //                           UIコントロール
    //----------------------------------------------------------------------
    @IBOutlet weak var testTitleLabel: UILabel!//テストのタイトルラベル
    @IBOutlet weak var startTestButton: UIButton!//テスト開始ボタン
    @IBOutlet weak var endTestButton: UIButton!//テスト終了ボタン
    @IBOutlet weak var testResultTitleLabel: UILabel!//テスト結果タイトルラベル
    @IBOutlet weak var testResultTextView: UITextView!//テスト結果詳細テキストビュー
    //----------------------------------------------------------------------
    //                         ViewController関数
    //----------------------------------------------------------------------
    //----------------------------
    //    viewDidLoad
    //----------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        //--------------------------UI初期処理-------------------------------
        testTitleLabel.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        startTestButton.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        endTestButton.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        testResultTitleLabel.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        testResultTextView.layer.setBoder(color: UIColor.black, thickness: normalThickness)
    }
    //----------------------------
    //didReceiveMemoryWarning
    //----------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //----------------------------------------------------------------------
    //                         カスタマイズ関数
    //----------------------------------------------------------------------
    
    //----------------------------------------------------------------------
    //                              button func
    //----------------------------------------------------------------------
    //touch up inside
    @IBAction func startTestBut(_ sender: UIButton, forEvent event: UIEvent) {
        let myCentral = CBCentralManager()
    }
    @IBAction func endTestBut(_ sender: UIButton, forEvent event: UIEvent) {
    }

}

