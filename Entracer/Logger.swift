//
//  Logger.swift
//  Entracer
//
//  Created by Tharindu Madushanka on 10/23/18.
//  Copyright © 2018 Entracer. All rights reserved.
//

import Foundation

/// Defines levels of logging that could be tagged for log messages.
public enum LogLevel: Int {
    /// Displays *none*
    case none = -1
    /// Displays *all* logs useful for developer.
    case debug = 0
    /// Displays *all* but debug logs.
    case info = 1
    /// Displays *only* warnings and above.
    case warning = 2
    /// Displays *only* error logs.
    case error = 3
}

/// `LogMessage` holds all the details for each log message.
struct LogMessage {
    
    let file: String
    let function: String
    let lineNumber: Int
    let text: String
    let level: LogLevel
    
    /**
     Initializes log message object with message details.
     
     - parameter file: File where log message was created.
     - parameter function: Function where log message was created.
     - parameter line: Line number
     - parameter text: Text for log message.
     - parameter level: Log level for log message.
    */
    init(path: String, function: String, line: Int, text: String, level: LogLevel) {
        self.file = path.components(separatedBy: "/").last!
        self.function = function
        self.lineNumber = line
        self.text = text
        self.level = level
    }
}

/// Any object that conforms to `LoggerDelegate` may log messages.
protocol LoggerDelegate {
    func display(message: LogMessage)
}

/// Manages log message delegates and log level.
class Logger {
    
    private static var delegates: [LoggerDelegate] = [LoggerDelegate]()
    private static var logLevel: LogLevel = .debug
    
    /**
     Adds LoggerDelegate object to display log messages.
     
     - parameter delegate: Logger delegate.
     */
    class func addLogger(delegate: LoggerDelegate) {
        delegates.append(delegate)
    }
    
    /**
     Sets active log level.
     
     - parameter level: Log level.
    */
    class func setLogger(level: LogLevel) {
        logLevel = level
    }
    
    /**
     Adds a debug message to log.
    */
    class func debug(text: String, _ path: String = #file, _ function: String = #function, _ line: Int = #line) {
        guard logLevel.rawValue >= LogLevel.debug.rawValue else { return }
        displayLogMessage(LogMessage(path: path, function: function, line: line, text: text, level: .debug))
    }
    
    /**
     Adds an information message to log.
     
     - paraeter text: Text to be displayed.
    */
    class func info(text: String, _ path: String = #file, _ function: String = #function, _ line: Int = #line) {
        guard logLevel.rawValue >= LogLevel.info.rawValue else { return }
        displayLogMessage(LogMessage(path: path, function: function, line: line, text: text, level: .info))
    }
    
    /**
     Adds a warning message to log.
     
     - paraeter text: Text to be displayed.
    */
    class func warning(text: String, _ path: String = #file, _ function: String = #function, _ line: Int = #line) {
        guard logLevel.rawValue >= LogLevel.warning.rawValue else { return }
        displayLogMessage(LogMessage(path: path, function: function, line: line, text: text, level: .warning))
    }
    
    /**
     Adds an error message to log.
     
     - paraeter text: Text to be displayed.
    */
    class func error(text: String, _ path: String = #file, _ function: String = #function, _ line: Int = #line) {
        guard logLevel.rawValue >= LogLevel.error.rawValue else { return }
        displayLogMessage(LogMessage(path: path, function: function, line: line, text: text, level: .error))
    }
    
    /**
     Displays log message calling all registered logger delegates.
     
     - parameter message: Log message to display.
     */
    class func displayLogMessage(_ message: LogMessage) {
        delegates.forEach() { $0.display(message: message) }
    }
}
