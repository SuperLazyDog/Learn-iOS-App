//
//  ViewController.swift
//  BlueToothTest
//
//  Created by 徐伟达 on 2017/4/30.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate, LayerSet, CBPeripheralManagerDelegate {
    //----------------------------------------------------------------------
    //                             プロパティ
    //----------------------------------------------------------------------
    var centralManager: CBCentralManager! = nil
    var peripheral: CBPeripheral! = nil
    var peripheralManager: CBPeripheralManager! = nil
    //----------------------------------------------------------------------
    //                           UIコントロール
    //----------------------------------------------------------------------
    @IBOutlet weak var testTitleLabel: UILabel!//テストのタイトルラベル
    @IBOutlet weak var startTestButton: UIButton!//テスト開始ボタン
    @IBOutlet weak var startTestPeripheralButton: UIButton!//ペリフェラルテスト開始ボタン
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
        startTestPeripheralButton.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        endTestButton.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        testResultTitleLabel.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        testResultTextView.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        //ボーダーを丸く設定する
        setRadioCorner(startTestButton, startTestButton.layer.frame.width/6)
        setRadioCorner(startTestPeripheralButton, startTestButton.layer.frame.width/6)
        setRadioCorner(endTestButton, startTestButton.layer.frame.width/6)
        //-----------------------------BLE----------------------------------
        let string = testResultTextView.text!
        testResultTextView.text = string + "\n"
        //セントラル、ペリフェラルのマネジャーを作る
        centralManager = CBCentralManager(delegate: self, queue: nil, options: nil)
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
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
        //scan
        if centralManager.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: nil, options: nil)
            print("start scan")
        }else {
            print("stop scan because of powerOff")
            return
        }
        //connect
        if peripheral != nil {
            print("found some service")
            centralManager.stopScan()
            centralManager.connect(peripheral, options: nil)
        }
        
    }
    @IBAction func startTestPeripheralBut(_ sender: UIButton, forEvent event: UIEvent) {
        //create service
        let myUUID = CBUUID(string: "8F235970-B3A1-4409-9AEF-129BB336F4A3")
        let myCharacteristc = CBMutableCharacteristic(type: myUUID, properties: CBCharacteristicProperties.read, value: nil, permissions: CBAttributePermissions.readable)
        let myServiceUUID = CBUUID(string: "00E39FAF-8770-4C8B-9AF2-9FD097B48505")
        let myService = CBMutableService(type: myServiceUUID, primary: true)
        myService.characteristics = [myCharacteristc]
        //add service
        if peripheralManager.state == .poweredOn {
            peripheralManager.add(myService)
        }else {
            return
        }
        //starting advertising
        if peripheralManager.state == .poweredOn {
            peripheralManager.startAdvertising([CBAdvertisementDataLocalNameKey: "\(myService.uuid)!"])
        }else {
            return
        }
    }
    @IBAction func endTestBut(_ sender: UIButton, forEvent event: UIEvent) {
    }
    //----------------------------------------------------------------------
    //                              protocol func
    //----------------------------------------------------------------------
    //----------------------------
    //          Central
    //----------------------------
    //CBCentralManagerDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if testResultTextView.text.hasPrefix("you are peripheral side") || testResultTextView.text.hasPrefix("请开始测试") {
            testResultTextView.text = "you are central side\n"
        }
        switch central.state {
        case .unknown:
            let state = "central state: unknown\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        case .unsupported:
            let state = "central state: unsupported\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        case .unauthorized:
            let state = "central state: unauthorized\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        case .poweredOff:
            let state = "central state: poweredOff\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        case .poweredOn:
            let state = "central state: poweredOn\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
            //centralManager.scanForPeripherals(withServices: nil, options: nil)
        case .resetting:
            let state = "central state: resetting\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        }
    }
    //didDiscover
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let state = "discoverd peripheral: \(peripheral)\n"
        let text = testResultTextView.text!
        print(state)
        testResultTextView.text = text + state
        self.peripheral = peripheral
    }
    //didConnect
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        let state = "connected!\n"
        let text = testResultTextView.text!
        print(state)
        testResultTextView.text = text + state
    }
    //didFailToConnect
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        let state = "failed to connected\n"
        let text = testResultTextView.text!
        print(state)
        testResultTextView.text = text + state
    }
    
    //----------------------------
    //        Peripheral
    //----------------------------
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if testResultTextView.text.hasPrefix("you are central side") || testResultTextView.text.hasPrefix("请开始测试") {
            testResultTextView.text = "you are peripheral side\n"
        }
        switch peripheral.state {
        case .unknown:
            let state = "peripheral state: unknown\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        case .unsupported:
            let state = "peripheral state: unsupported\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        case .unauthorized:
            let state = "peripheral state: unauthorized\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        case .poweredOff:
            let state = "peripheral state: poweredOff\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        case .poweredOn:
            let state = "peripheral state: poweredOn\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        case .resetting:
            let state = "peripheral state: resetting\n"
            let text = testResultTextView.text!
            print(state)
            testResultTextView.text = text + state
        }
    }
    
    //didAdd service
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        let originMsg = testResultTextView.text!
        if let error = error {
            let failMsg = "failed to add service. error: \(error)\n"
            print(failMsg)
            testResultTextView.text = originMsg + failMsg
            return
        }
        let sucMsg = "add service successfully\n"
        print(sucMsg)
        testResultTextView.text = originMsg + sucMsg
        
    }
    //StartAdvertising
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        let originMsg = testResultTextView.text!
        if let error = error {
            let failMsg = "failed to Start Advertising. error: \(error)\n"
            print(failMsg)
            testResultTextView.text = originMsg + failMsg
            return
        }
        let sucMsg = "start Advertising successfully\n"
        testResultTextView.text = originMsg + sucMsg
        print(sucMsg)
        
    }
    

}

