//
//  ContentView.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/4/26.
//

import SwiftUI

struct ContentView: View {
    var devices: [String] = []
    var body: some View {
        NavigationStack(root: {
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
            .toolbar(content: {
                ToolbarItem(
                    placement: .automatic,
                    content: {
                        Image(systemName: "plus").padding(4)
                    }
                )
                ToolbarItem(
                    placement: .topBarLeading,
                    content: {
                        Image(systemName: "bell.badge.fill")
                    }
                )
                ToolbarItem(
                    placement: .principal,
                    content: {
                        Text("Devices").font(
                            .system(size: 32, weight: Font.Weight.bold)
                        )
                    }
                )
            })

        })

    }

}

#Preview {
    ContentView()
}
