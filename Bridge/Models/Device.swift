import Foundation
//
//  Device.swift
//  Bridge
//
//  Created by Khaled Mohamed Ali on 1/4/26.
//
import SwiftUI

enum DeviceStatus: String, Codable {
    case online, offline
}

struct Device: Codable, Identifiable, Equatable {

    var id: UUID
    var name: String
    var status: DeviceStatus
    var icon: String

    func rename(newName: String) -> String {
        return ""
    }
}
