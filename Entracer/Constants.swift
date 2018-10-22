//
//  Constants.swift
//  Entracer
//
//  Created by Tharindu Madushanka on 10/16/18.
//  Copyright © 2018 Entracer. All rights reserved.
//

import Foundation

/// API constants.
struct APIConstants {
    static let BasePath = "https://app.entracer.com/"
    static let Version = "api/v1"
    static let DefaultHeaders: [String: String] = [
        "Accept": "application/json",
        "Content-Type": "application/json"]
}

/// API end points.
enum EndPoints: String {
    case events = "/events/"
    case people = "/people/"
    case trigger = "/trigger/"
}

/// Event channel types.
enum EventChannel: String {
    case app
}

/// Event device types.
enum EventDevice: String {
    case web
    case android
    case ios
}

