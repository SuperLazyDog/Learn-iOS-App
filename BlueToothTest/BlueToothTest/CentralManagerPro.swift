//
//  CentralManageDelegate.swift
//  BlueToothTest
//
//  Created by 徐伟达 on 2017/5/2.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import Foundation
import CoreBluetooth

class CentralManagerPro: NSObject, CBCentralManagerDelegate {
    //------------------------------------------------------------------------
    //                              プロパティ
    //------------------------------------------------------------------------
    //------------------------------------------------
    //              セントラルモードのため
    //------------------------------------------------
    private var centralManager: CBCentralManager! = nil
    private var peripheral: CBPeripheral! = nil
    private var peripheralPro = PeripheralPro()
    //------------------------------------------------------------------------
    //                            イニシャライザ
    //------------------------------------------------------------------------
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil, options: nil)
    }
    //------------------------------------------------------------------------
    //                          カスタマイズメソード
    //------------------------------------------------------------------------
    //-------------------------------------------------------
    //               centralManager API
    //-------------------------------------------------------
    //検出を開始
    @discardableResult
    func startScan() -> Bool {
        if centralManager.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: [CBUUID(string: "690FFDA6-F0A6-43C4-AEE4-3C98C6F72BCC")], options: nil)
            print("start Scan")
            return true
        }else {
            return false
        }
    }
    //検出を終了
    func stopScan() {
        centralManager.stopScan()
        print("stop Scan")
    }
    //検出されたペリフェラルと接続
    @discardableResult
    func connectPeripheral() -> Bool {
        if peripheral != nil {
            centralManager.connect(peripheral, options: nil)
            return true
        }else {
            return false
        }
    }
    //接続をキャンセル
    @discardableResult
    func cancelConnect() -> Bool {
        if peripheral != nil {
            centralManager.cancelPeripheralConnection(peripheral)
            return true
        }
        return false
    }
    //ペリフェラルを取得
    func getPeripheral() -> CBPeripheral {
        return peripheral
    }
    
    //------------------------------------------------------------------------
    //                          プロトコルのメソード
    //------------------------------------------------------------------------
    //------------------------------------------------
    //            CBCentralManagerDelegate
    //------------------------------------------------
    //DidUpdateState
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .unknown:
            let state = "central state: unknown\n"
            print(state)
        case .unsupported:
            let state = "central state: unsupported\n"
            print(state)
        case .unauthorized:
            let state = "central state: unauthorized\n"
            print(state)
        case .poweredOff:
            let state = "central state: power off\n"
            print(state)
        case .poweredOn:
            let state = "central state: power on\n"
            print(state)
        case .resetting:
            let state = "central state: resetting\n"
            print(state)
            
        }
    }
    //didDiscover
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let state = "discoverd peripheral: \(peripheral)\n"
        print(state)
        self.peripheral = peripheral
    }
    //didConnect
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        let state = "Central: connected to Peripheral!\n"
        print(state)
        //peripheral.delegate = peripheralPro
        peripheralPro.setPeripheral(peripheral: peripheral)
        peripheralPro.discoverService(serviceUUIDs: [CBUUID(string: "BA60ABED-AAED-4DCA-A04E-BBF21DEFB6DD")])
    }
    //didDisconnect
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        guard let error = error else {
            let state = "central: disconnected"
            print(state)
            return
        }
        print("central: disconnected error \(error)")
        print(error.localizedDescription)
    }
    //didFailToConnect
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        let state = "central: failed to connected\n"
        print(state + error.debugDescription)
    }
}
