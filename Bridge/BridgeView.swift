//
//  BridgeView.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/4/26.
//

import SwiftUI

struct BridgeView: View {
    var devices: [String] = []
    var body: some View {
        NavigationStack {
            Group {
                if devices.isEmpty {
                    ContentUnavailableView(
                        "No devices connected",
                        systemImage: "wifi.slash"
                    )
                } else {
                    List(devices, id: \.self) { device in
                        Text(device)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Image(systemName: "plus").padding(4)
                }
                ToolbarItem(placement: .principal) {
                    Text("Devices").font(
                        .system(size: 32, weight: Font.Weight.bold)
                    )
                }
            }
        }
    }
    

}

#Preview {
    BridgeView()
}
