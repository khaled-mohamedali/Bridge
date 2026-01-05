//
//  ReProvisionView.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/5/26.
//

import SwiftUI

struct ReProvisionView: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    var body: some View {
      
        Group {
                    if verticalSizeClass == .compact {
                        ScrollView {
                            MainView()
                        }
                    } else {
                      MainView()
                    }
                }
               
            }
}

struct MainView: View {
    var body: some View {
        VStack(spacing: 15) {
            WiFiIcon()
            Text(verbatim: "Re-provision Wi-Fi").font(.system(size: 24, weight: .semibold))
            Text("This will reconnect your device to a new Wi-Fi network using Bleutooth.")
                .multilineTextAlignment(.center)
                .font(.system(size: 16))
            
            DisclaimerBanner()
            VStack(alignment: .leading, spacing: 16) {
                StepRow(
                    number: 1,
                    text: "Connect via Bluetooth",
                    isActive: true
                )
                
                StepRow(
                    number: 2,
                    text: "Select your Wi-Fi network",
                    isActive: false
                )
                
                StepRow(
                    number: 3,
                    text: "Enter password and connect",
                    isActive: false
                )
            }
            .padding()
            Spacer()
            
            Button(action: {
                    // Continue action
                }) {
                    Text("Continue")
                        .font(.system(size: 17, weight: .semibold))
                        .frame(maxWidth: .infinity, minHeight: 52)
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(14)
                

            Button(action: {
                  // Cancel action
              }) {
                  Text("Cancel")
                      .font(.system(size: 17, weight: .medium))
                      .frame(maxWidth: .infinity, minHeight: 52)
              }
              .background(Color.gray.opacity(0.2))
              .foregroundColor(.primary)
              .cornerRadius(14)

        }
        .padding(20)
    }
}

struct StepRow: View {
    let number: Int
    let text: String
    let isActive: Bool

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(isActive ? Color.blue : Color.gray.opacity(0.3))
                    .frame(width: 28, height: 28)

                Text("\(number)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(isActive ? .white : .gray)
            }

            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(isActive ? .primary : .secondary)
        }
    }
}

struct DisclaimerBanner: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "exclamationmark.circle")
                .foregroundColor(.orange)
                .font(.system(size: 20, weight: .semibold))
            DisclaimerText()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.orange.opacity(0.12))
        ).overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.orange.opacity(0.6), lineWidth: 1)
        ).padding(.horizontal)    }
}

struct WiFiIcon: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue.opacity(0.08))  // soft light-blue circle
                .frame(width: 100, height: 100)
            Image(systemName: "wifi")
                .font(.system(size: 46, weight: .semibold))
                .foregroundColor(Color.blue)  // icon color
        }
    }
}

struct DisclaimerText: View {
    var body : some View{
        VStack (alignment: .leading, spacing: 6){
            Text("Temporary Disconnection")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.orange)
            Text(
                "Your device will go offline briefly while switching networks. This is normal and should take less than a minute."
            ).font(.system(size: 14))
                .foregroundColor(.orange.opacity(0.9))
        }
    }
}

struct Controls : View {
    var body: some View {
        VStack{
            Button("Continue") {
                
                //
            }
            Button("Cancel"){
                //
            }
            
            
        }.padding()
    }
}

#Preview {
    ReProvisionView()
}
