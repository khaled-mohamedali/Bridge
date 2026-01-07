//
//  BluetoothManger.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/7/26.
//

internal import Combine
import CoreBluetooth
import Foundation

class BluetoothManager: NSObject, ObservableObject, CBCentralManagerDelegate {

    // MARK: - Published state (SwifUI observes these)
    @Published var bluetoothState = CBManagerState.unknown
    @Published var isScanning: Bool = false
    @Published var devices: [CBPeripheral] = []
    
    private var hasStartedScanning = false


    //  MARK: - CoreBluetooth
    private var central: CBCentralManager!

    override init() {
        super.init()
        central = CBCentralManager(delegate: self, queue: .main)

    }

    //MARK: - CBCentralManagerDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        bluetoothState = central.state
            print("Bluetooth state changed:", central.state.rawValue)

            if central.state == .poweredOn && !hasStartedScanning {
                hasStartedScanning = true
                startScan()
            }
    }

    func startScan() {
        print("Starting scan")
        devices.removeAll()
        isScanning = true
        central.scanForPeripherals(withServices: nil, options: nil)
    }


    func stopScan() {
        print("Stopped scaning ")
        central.stopScan()
        isScanning = false
    }

    func centralManager(
        _ central: CBCentralManager,
        didDiscover peripheral: CBPeripheral,
        advertisementData: [String: Any],
        rssi RSSI: NSNumber
    ) {
        //1. Deduplicate by identifier
        let alreadyAdded = devices.contains{$0.identifier == peripheral.identifier}
        if alreadyAdded{
            return
        }
        
        //add the new device
        devices.append(peripheral)

    }
}
