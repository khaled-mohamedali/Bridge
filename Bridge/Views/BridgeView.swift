//
//  BridgeView.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/4/26.
//

import SwiftUI

struct BridgeView: View {

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
                    emptyState
                } else {
                    devicesList
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                addDevice
                frameTitle
            }
        }
    }
    
    
    
    
    private var emptyState: some View {
        ContentUnavailableView(
            "No devices connected",
            systemImage: "wifi.slash"
        )
    }

    private var devicesList: some View {
        VStack {
            ScrollView {
                ForEach(devices) { device in
                    DeviceRow(device: device)
                }
            }
        }
    }

    private var addDevice: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            NavigationLink {
                ReProvisionView()
            } label: {
                Image(systemName: "plus")
            }
        }
    }

    private var frameTitle: some ToolbarContent {

        ToolbarItem(placement: .principal) {
            Text("Devices").font(
                .system(size: 32, weight: Font.Weight.bold)
            )
        }
    }

}

#Preview {
    BridgeView()
}
