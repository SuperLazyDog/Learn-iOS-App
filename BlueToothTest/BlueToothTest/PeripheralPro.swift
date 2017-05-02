//
//  PeripheralPro.swift
//  BlueToothTest
//
//  Created by 徐伟达 on 2017/5/2.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import Foundation
import CoreBluetooth

class PeripheralPro: NSObject, CBPeripheralDelegate {
    //------------------------------------------------------------------------
    //                              プロパティ
    //------------------------------------------------------------------------
    //------------------------------------------------
    //              セントラルモードのため
    //------------------------------------------------
    var peripheral: CBPeripheral! = nil
    //------------------------------------------------------------------------
    //                            イニシャライザ
    //------------------------------------------------------------------------
    override init() {
        super.init()
    }
    
    //------------------------------------------------------------------------
    //                          カスタマイズメソード
    //------------------------------------------------------------------------
    func setPeripheral(peripheral: CBPeripheral) {
        self.peripheral = peripheral
        peripheral.delegate = self
    }
    //-------------------------------------------------------
    //                 peripheral API
    //-------------------------------------------------------
    //サービスを検索
    @discardableResult
    func discoverService(serviceUUIDs: [CBUUID]?) -> Bool {
        if peripheral != nil {
            peripheral.discoverServices(serviceUUIDs)
            return true
        }else {
            return false
        }
    }
    //サービスの特性を検出する
    @discardableResult
    func discoverCharacteristics(characteristicUUIDs: [CBUUID]?, for service: CBService) -> Bool {
        if peripheral != nil {
            peripheral.discoverCharacteristics(characteristicUUIDs, for: service)
            return true
        }else {
            return false
        }
    }
    //特性の値を読み取る、変更された時に通知を読み取る
    func readValueForChar(for char: CBCharacteristic) {
        peripheral.readValue(for: char)
    }
    
    //特性の値を書き込む
    func writeValueForChar(data: Data, for char: CBCharacteristic) {
        peripheral.writeValue(data, for: char, type: CBCharacteristicWriteType.withoutResponse)
    }
    
    //特性の値が変更するときに通知を受け取る
    func setNotifyValueEnable(for char: CBCharacteristic) {
        peripheral.setNotifyValue(true, for: char)
    }
    
    //特性の値が変更するときに通知を受け取る
    func setNotifyDisable(for char: CBCharacteristic) {
        peripheral.setNotifyValue(false, for: char)
    }
    //------------------------------------------------------------------------
    //                          プロトコルのメソード
    //------------------------------------------------------------------------
    //------------------------------------------------
    //            CBPeripheralDelegate
    //------------------------------------------------
    //didDiscoverServices
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else{
            print("error")
            return
        }
        print("\(services.count)個のサービスを発見。\(services)")
    }
    //didDiscoverCharacteristicsFor
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let error = error {
            print("error: \(error)")
            return
        }
        
        let characteristics = service.characteristics
        print("Found \(characteristics?.count ?? 0) characteristics! : \(characteristics)")
    }
    //didUpdateValueFor
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("Failed... error: \(error)")
            return
        }
        print("Succeeded! service uuid: \(characteristic.service.uuid), characteristic uuid: \(characteristic.uuid), value: \(characteristic.value)")
    }
    //didUpdateNotificationStateFor
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("Notify状態更新失敗...error: \(error)")
        } else {
            print("Notify状態更新成功！ isNotifying: \(characteristic.isNotifying)")
        }
    }
    //didWriteValueFor
    func peripheral(_ peripheral: CBPeripheral, didWriteValueFor characteristic: CBCharacteristic, error: Error?) {
        if let error = error {
            print("Write失敗...error: \(error)")
            return
        }
        print("Write成功！")
    }
}
