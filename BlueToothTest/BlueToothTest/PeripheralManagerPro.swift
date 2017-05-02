//
//  PeripheralManagerPro.swift
//  BlueToothTest
//
//  Created by 徐伟达 on 2017/5/2.
//  Copyright © 2017年 徐伟达. All rights reserved.
//

import Foundation
import CoreBluetooth

class PeripheralManagerPro: NSObject, CBPeripheralManagerDelegate {
    //------------------------------------------------------------------------
    //                              プロパティ
    //------------------------------------------------------------------------
    //------------------------------------------------
    //              ペリフェラルモードのため
    //------------------------------------------------
    var peripheralManager: CBPeripheralManager! = nil
    var characteristic: CBMutableCharacteristic! = nil
    //------------------------------------------------------------------------
    //                            イニシャライザ
    //------------------------------------------------------------------------
    override init() {
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: nil)
    }
    
    
    //------------------------------------------------------------------------
    //                          カスタマイズメソード
    //------------------------------------------------------------------------
    //-------------------------------------------------------
    //              PeripheralManager API
    //-------------------------------------------------------
    //UUIDを作る
    private func createUUID(uuidAs: String) -> CBUUID {
        let uuid = CBUUID(string: uuidAs)
        return uuid
    }
    //特性を作る
    func createMutableCharacteristic(uuidAs: String) -> CBMutableCharacteristic {
        let uuid = createUUID(uuidAs: uuidAs)
        let properties = CBCharacteristicProperties.read
        let permissions = CBAttributePermissions.readable
        let characteristic = CBMutableCharacteristic(type: uuid, properties: properties, value: nil, permissions: permissions)
        return characteristic
    }
    //主サービスを作る
    func createPriService(uuidAs: String) -> CBMutableService {
        let uuid = createUUID(uuidAs: uuidAs)
        let service = CBMutableService(type: uuid, primary: true)
        return service
    }
    //サービスの特性を設定
    func addCharacteristics(chars: [CBMutableCharacteristic], into service: CBMutableService) {
        service.characteristics = chars
    }
    
    //サービスを追加
    func addService(service: CBMutableService) {
        peripheralManager.add(service)
    }
    
    //startAdvertising
    func startAdvertising(services: [CBMutableService]) {
        var uuidArray: [CBUUID] = []
        for service in services {
            uuidArray.append(service.uuid)
        }
        peripheralManager.startAdvertising([CBAdvertisementDataServiceUUIDsKey : uuidArray])
    }
    func startAdvertising(UUID: String) {
        //let serviceUUID = CBUUID(string: UUID)
        peripheralManager.startAdvertising([CBAdvertisementDataLocalNameKey : UUID])
    }
    //stopAdvertising
    func stopAdvertising() {
        peripheralManager.stopAdvertising()
    }
    
    //値を更新して通知を申し込んだセントラルに通知する
    /*characteristic.value = data
     peripheralManager.updateValue(data, forCharacteristic: characteristic, onSubscribedCentrals: nil)
     */
 
    //------------------------------------------------------------------------
    //                          プロトコルのメソード
    //------------------------------------------------------------------------
    //------------------------------------------------
    //            CBPeripheralManagerDelegate
    //------------------------------------------------
    //DidUpdateState
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .unknown:
            let state = "peripheral state: unknown\n"
            print(state)
        case .unsupported:
            let state = "peripheral state: unsupported\n"
            print(state)
        case .unauthorized:
            let state = "peripheral state: unauthorized\n"
            print(state)
        case .poweredOff:
            let state = "peripheral state: poweredOff\n"
            print(state)
        case .poweredOn:
            let state = "peripheral state: poweredOn\n"
            print(state)
        case .resetting:
            let state = "peripheral state: resetting\n"
            print(state)
        }
    }
    //didAdd
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        if let error = error {
            let failMsg = "failed to add service. error: \(error)\n"
            print(failMsg)
            return
        }
        let sucMsg = "add service successfully\nservice :"
        print(sucMsg)
        print(service)
    }
    //didStartAdvertising
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
            print("***Advertising ERROR: \(error)")
            return
        }
        print("Advertising success")
    }
    //didReceiveRead
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        if characteristic == nil {
            peripheralManager.respond(to: request, withResult: .requestNotSupported)
            return
        }
        if request.characteristic.uuid.isEqual(characteristic.uuid) {
            request.value = characteristic.value
        }
        peripheralManager.respond(to: request, withResult: .success)
    }
    
    //didReceiveWrite
    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        if characteristic == nil {
            peripheralManager.respond(to: requests[0], withResult: .requestNotSupported)
            return
        }
        for request in requests {
            if request.characteristic.uuid.isEqual(characteristic.uuid) {
                characteristic.value = request.value
            }else {
                peripheralManager.respond(to: requests[0], withResult: .requestNotSupported)
            }
        }
        peripheralManager.respond(to: requests[0], withResult: .success)
    }
    
    //didSubscribeTo
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
        print("Subscribeリクエストを受信")
        print("Subscribe中のセントラル: \(central)")
    }
    //didUnsubscribeFromCharacteristic
    func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didUnsubscribeFrom characteristic: CBCharacteristic) {
        print("Notify停止リクエストを受信")
        print("Notify中のセントラル: \(central)")
    }
    
    

}
