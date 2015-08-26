//
//  Structs.swift
//  PermissionScope
//
//  Created by Nick O'Neill on 8/21/15.
//  Copyright © 2015 That Thing in Swift. All rights reserved.
//

import Foundation
import HealthKit

@objc public enum PermissionType: Int, CustomStringConvertible {
    case Contacts, LocationAlways, LocationInUse, Notifications, Microphone, Camera, Photos, Reminders, Events, Bluetooth, Motion, HealthKit
    
    public var prettyDescription: String {
        switch self {
        case .LocationAlways, .LocationInUse:
            return "Location"
        default:
            return "\(self)"
        }
    }
    
    public var isHealthKit: Bool {
        if case .HealthKit = self {
            return true
        }
        return false
    }
    
    public var description: String {
        switch self {
        case .Contacts:         return "Contacts"
        case .Events:           return "Events"
        case .LocationAlways:   return "LocationAlways"
        case .LocationInUse:    return "LocationInUse"
        case .Notifications:    return "Notifications"
        case .Microphone:       return "Microphone"
        case .Camera:           return "Camera"
        case .Photos:           return "Photos"
        case .Reminders:        return "Reminders"
        case .Bluetooth:        return "Bluetooth"
        case .Motion:           return "Motion"
        case .HealthKit:        return "HealthKit"
        }
    }
    
    // Watch out for
    static let allValues:[PermissionType] = [Contacts, LocationAlways, LocationInUse, Notifications, Microphone, Camera, Photos, Reminders, Events, Bluetooth, Motion, HealthKit]
}

@objc public enum PermissionStatus: Int, CustomStringConvertible {
    case Authorized, Unauthorized, Unknown, Disabled
    
    public var description: String {
        switch self {
        case .Authorized:   return "Authorized"
        case .Unauthorized: return "Unauthorized"
        case .Unknown:      return "Unknown"
        case .Disabled:     return "Disabled" // System-level
        }
    }
}

@objc public class PermissionResult: NSObject {
    public let type: PermissionType
    public let status: PermissionStatus
    
    internal init(type:PermissionType, status:PermissionStatus) {
        self.type   = type
        self.status = status
    }
    
    override public var description: String {
        return "\(type) \(status)"
    }
}
