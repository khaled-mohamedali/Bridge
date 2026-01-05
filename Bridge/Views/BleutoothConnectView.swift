//
//  BleutoothConnectView.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/5/26.
//

import SwiftUI

struct BleutoothConnectView: View {
    @State private var pulse = false
    @State private var breathe = false
    var body: some View {
        VStack {
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
                    .animation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true), value: breathe)
            }
            .onAppear {
                pulse = true
                breathe = true
            }

        }
    }
}

#Preview {
    BleutoothConnectView()
}
