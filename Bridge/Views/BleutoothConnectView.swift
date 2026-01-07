//
//  BleutoothConnectView.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/5/26.
//

import CoreBluetooth
import SwiftUI

struct BleutoothConnectView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var showResults = false
    @StateObject private var bt = BluetoothManager()
    var body: some View {
        VStack {
            if !showResults {
                scanningView
            } else {
                devicesList
            }

            PrimaryButton(
                title: "Cancel",
                foreground: Color.primary,
                background: Color.gray.opacity(0.2)
            ) {
                dismiss()
            }
        }
        .padding(20)
        .onAppear {
            showResults = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showResults = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                bt.stopScan()

            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("List of Devices")
                    .font(.system(size: 32, weight: Font.Weight.bold))
            }
        }
    }

    private var scanningView: some View {
        VStack(alignment: .center) {
            BluetoothIcon().padding()
            Text("Scanning Bluetooth...")
                .font(.system(size: 20, weight: .semibold))
                .padding()
            Text(
                "Searching for your device.... Make sure Bleutooth is enable on your phone and device"
            ).multilineTextAlignment(.center)
                .foregroundStyle(Color.gray)
        }
        .frame(maxHeight: .infinity)
    }

    private var devicesList: some View {
        List {
            if bt.devices.isEmpty {
                Text("No devices nearby")
            } else {
                ForEach(
                    bt.devices.sorted {
                        ($0.name ?? "") > ($1.name ?? "")
                    },
                    id: \.identifier
                ) { peripheral in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(peripheral.name ?? "Unknown device")
                            .font(.headline)

                        Text(peripheral.identifier.uuidString)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
            }
        }.listStyle(.plain)

    }
}

struct BluetoothIcon: View {
    @State private var pulse = false
    @State private var breathe = false
    var body: some View {
        ZStack {
            // Outer pulse ring
            Circle()
                .fill(Color.accentColor.opacity(0.6))
                .frame(width: 120, height: 120)
                .scaleEffect(pulse ? 1.7 : 0.9)
                .opacity(pulse ? 0.0 : 0.7)
                .animation(
                    .easeOut(duration: 1.5).repeatForever(
                        autoreverses: false
                    ),
                    value: pulse
                )
            Circle()
                .fill(.blue)
                .frame(width: 100, height: 100)

            Image("bluetooth")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundStyle(.white)
                .scaleEffect(breathe ? 1.06 : 0.98)
                .animation(
                    .easeInOut(duration: 1.2).repeatForever(autoreverses: true),
                    value: breathe
                )
        }
        .onAppear {
            pulse = true
            breathe = true
        }
    }
}

#Preview {
    BleutoothConnectView()
}
