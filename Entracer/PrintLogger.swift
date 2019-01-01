//
//  PrintLogger.swift
//  Entracer
//
//  Created by Tharindu Madushanka on 10/25/18.
//  Copyright © 2018 Entracer. All rights reserved.
//

import Foundation

/// Formats and prints messages with print function
class PrintLogger: LoggerDelegate {
    
    /// Prints message to console with message information.
    func display(message: LogMessage) {
        print("[Entracer \(message.file)  \(message.function)][\(message.lineNumber)]: \(message.text)")
    }
}
