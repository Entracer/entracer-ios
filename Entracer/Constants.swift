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
    static let BasePath = "https://app.entracer.com"
    static let Version = "/api/v1"
    static let DefaultHeaders: [String: String] = [
        "Accept": "application/json",
        "Content-Type": "application/json"]
}

/// API end points.
enum EndPoints: String {
    case events = "/events"
    case people = "/people"
    case organisations = "/organisations"
    case trigger = "/trigger"
}

/// API end paths.
enum EndPaths: String {
    case createOrUpdate = "/create_or_update"
}

/// Event channel types examples for api.
enum EventChannel: String {
    case web
    case mobile
    case social_media
    case support
}

/// Event device types examples for api.
enum EventDevice: String {
    case web = "Web"
    case mobile = "Mobile"
}

/// Event os types examples for api.
enum EventOS: String {
    case windows = "Windows"
    case mac = "Mac"
    case Android = "Android"
    case ios = "iOS"
}

