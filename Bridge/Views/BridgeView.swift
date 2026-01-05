//
//  BridgeView.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/4/26.
//

import SwiftUI

struct BridgeView: View {
    @State private var showReprovision = false
    let devices: [Device] = [
        Device(
            id: UUID(),
            name: "Living Room Lamp",
            status: .online,
            icon: "lightbulb"
        ),
        Device(
            id: UUID(),
            name: "Office Fan",
            status: .offline,
            icon: "fanblades"
        ),
        Device(
            id: UUID(),
            name: "Bedroom Thermostat",
            status: .online,
            icon: "thermometer"
        ),
        Device(
            id: UUID(),
            name: "Kitchen Speaker",
            status: .online,
            icon: "speaker.wave.2"
        ),
    ]
    var body: some View {
        NavigationStack {
            Group {
                if devices.isEmpty {
                    ContentUnavailableView(
                        "No devices connected",
                        systemImage: "wifi.slash"
                    )
                } else {
                    VStack {
                        ScrollView {
                            ForEach(devices) { device in
                                DeviceRow(device: device)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showReprovision = true
                    } label: {
                        Image(systemName: "plus")
                            .padding(4)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Devices").font(
                        .system(size: 32, weight: Font.Weight.bold)
                    )
                }
            } .navigationDestination(isPresented: $showReprovision) {
                ReProvisionView()
            }
        }
    }

}

#Preview {
    BridgeView()
}
