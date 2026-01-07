//
//  BleutoothConnectView.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/5/26.
//

import SwiftUI

struct BleutoothConnectView: View {

    var body: some View {
        VStack {
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
            ButtonPrimary(
                title: "Cancel",
                foreground: Color.primary,
                background: Color.gray.opacity(0.2)
            )
        }
        .padding(20)
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
