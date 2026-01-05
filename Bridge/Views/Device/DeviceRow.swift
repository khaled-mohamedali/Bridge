//
//  DeviceRow.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/4/26.
//

import SwiftUI

struct DeviceRow: View {

    let device: Device
    var body: some View {
        HStack(spacing: 16) {
            //Creating the box for the icon
            ZStack {
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.yellow.opacity(0.25))
                    .frame(width: 56, height: 56)
                Image(systemName: device.icon)
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundStyle(Color.orange)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(device.name)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(Color.black)
                HStack {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(
                            device.status == .online ? Color.green : Color.gray
                        )

                    Text(device.status  == .online ? "Online" : "Offline")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(device.status == .online ? Color.green : Color.gray)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.gray.opacity(0.6))
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color.white)
        ).shadow(color: .blue.opacity(0.08),radius: 10, x: 0, y: 6)
            .padding(.horizontal)

    }
}

