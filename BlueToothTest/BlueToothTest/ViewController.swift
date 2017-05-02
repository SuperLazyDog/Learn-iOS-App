//
//  ViewController.swift
//  BlueToothTest
//
//  Created by 徐伟达 on 2017/4/30.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, LayerSet{
    //----------------------------------------------------------------------
    //                             プロパティ
    //----------------------------------------------------------------------
    let centralMode = CentralManagerPro()
    var peripheral = PeripheralPro()
    let peripheralMode = PeripheralManagerPro()
    //----------------------------------------------------------------------
    //                           UIコントロール
    //----------------------------------------------------------------------
    @IBOutlet weak var testTitleLabel: UILabel!//テストのタイトルラベル
    @IBOutlet weak var centralTestButton: UIButton!//テスト開始ボタン
    @IBOutlet weak var peripheralButton: UIButton!//ペリフェラルテスト開始ボタン 
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
        centralTestButton.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        peripheralButton.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        endTestButton.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        testResultTitleLabel.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        testResultTextView.layer.setBoder(color: UIColor.black, thickness: normalThickness)
        //ボーダーを丸く設定する
        setRadioCorner(centralTestButton, centralTestButton.layer.frame.width/6)
        setRadioCorner(peripheralButton, centralTestButton.layer.frame.width/6)
        setRadioCorner(endTestButton, centralTestButton.layer.frame.width/6)
        //-----------------------------BLE----------------------------------
        let string = testResultTextView.text!
        testResultTextView.text = string + "\n"
        //セントラル、ペリフェラルのマネジャーを作る
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
    //-------------------------------------------------------------
    //                     Central Test But
    //-------------------------------------------------------------
    @IBAction func centralTestBut(_ sender: UIButton) {
        centralMode.startScan()
    }
    //-------------------------------------------------------------
    //                     Peripheral Test But
    //-------------------------------------------------------------
    var myUUID: CBUUID! = nil
    var myCharacteristc:CBMutableCharacteristic! = nil
    var myServiceUUID: CBUUID! = nil
    var myService: CBMutableService! = nil
    @IBAction func peripheralBut(_ sender: UIButton) {
        let characteristic = peripheralMode.createMutableCharacteristic(uuidAs: "52C31018-2EC8-41FE-9A85-8ED091B6AEA4")
        let service = peripheralMode.createPriService(uuidAs: "BA60ABED-AAED-4DCA-A04E-BBF21DEFB6DD")
        peripheralMode.addCharacteristics(chars: [characteristic], into: service)
        peripheralMode.addService(service: service)
        peripheralMode.startAdvertising(UUID: "BA60ABED-AAED-4DCA-A04E-BBF21DEFB6DD")
    }
    
    //---------------------------
    //        セントラル
    //---------------------------
    /*@IBAction func startTestBut(_ sender: UIButton, forEvent event: UIEvent) {
        //scan
        if centralManager.state == .poweredOn {
            myServiceUUID = CBUUID(string: "F4A5F4BA-C26A-49EC-9250-2A0C2C4F12AE")
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
            peripheral.discoverServices(nil)
        }
        
    }
    
    //---------------------------
    //       ペリフェラル
    //---------------------------
    //create service
    var myUUID: CBUUID! = nil
    var myCharacteristc:CBMutableCharacteristic! = nil
    var myServiceUUID: CBUUID! = nil
    var myService: CBMutableService! = nil
    @IBAction func startTestPeripheralBut(_ sender: UIButton, forEvent event: UIEvent) {
        //create service
        myUUID = CBUUID(string: "8F235970-B3A1-4409-9AEF-129BB336F4A3")
        myCharacteristc = CBMutableCharacteristic(type: myUUID, properties: CBCharacteristicProperties.read, value: Data(base64Encoded: "as"), permissions: CBAttributePermissions.readable)
        myServiceUUID = CBUUID(string: "00E39FAF-8770-4C8B-9AF2-9FD097B48505")
        myService = CBMutableService(type: myServiceUUID, primary: true)
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
        let state = "discoverd peripheral: \(peripheral.services)\n"
        let text = testResultTextView.text!
        print(state)
        testResultTextView.text = text + state
        self.peripheral = peripheral
        self.peripheral.delegate = self
    }
    //didConnect
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        let state = "central: connected!\n"
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
        print(service)
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
    //didReceiveRead, didReceiveWrite
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        if request.characteristic.uuid.isEqual(myCharacteristc.uuid) {
            request.value = myCharacteristc.value
            
            peripheral.respond(to: request, withResult: .success)
        }
    }
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        for request in requests {
            if request.characteristic.uuid.isEqual(myCharacteristc.uuid) {
                myCharacteristc.value = request.characteristic.value
                peripheral.respond(to: request, withResult: .success)
            }else {
                peripheral.respond(to: request, withResult: .writeNotPermitted)
                return
            }
        }
    }
    //didSubscribeTo, didUnsubscribeFrom
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        print("Subscribe request by: \(central)")
    }
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        print("Unsubscribe request by: \(central)")
    }
    
    
    //peripheral delegate
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else{
            print("error")
            return
        }
        print("\(services.count)個のサービスを発見。\(services)")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            print("\(characteristics.count)個のキャラクタリスティックを発見。\(characteristics)")
        }
    }*/
}

