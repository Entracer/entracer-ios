//
//  Entracer.swift
//  Entracer
//
//  Created by Tharindu Madushanka on 10/10/18.
//  Copyright © 2018 Entracer. All rights reserved.
//

import Foundation

/// Main class for integrating Entracer with your app
open class Entracer {
    
    /// The singleton `Entracer` instance
    static let instance = Entracer()
    
    /// Entracer API token.
    var apiToken = ""
    
    /// Person identifier
    var personID = ""
    
    /// Organisation identifier
    var organisationID = ""
    
    /// Private initializer
    private init() {}
    
    /**
     Configures Entracer shared instance with API token.
     
     - parameter token: Entracer API token to communicate.
     */
    open class func configure(token apiToken: String) {
        
        Entracer.instance.apiToken = apiToken
    }
    
    /// Debuggable description.
    open var debugDescription: String {
        return "<\(String(describing: self)) Token: \(apiToken)>"
    }
    
    /**
     Resets all properties, useful when logging out.
     */
    open class func reset() {
        
        let entracer = Entracer.instance
        entracer.apiToken = ""
        entracer.personID = ""
        entracer.organisationID = ""
    }
    
    /**
     Triggers an event with person. A person can be specified optionally.
     
     - parameter event: Event identifier name.
     - parameter personID: Optional person id.
    */
    open func trigger(event: String, personID: String?) {
        
        let path = APIConstants.Version + EndPoints.events.rawValue + event + EndPoints.trigger.rawValue
        var dict = [String: Any]()
        if let pid = personID {
            dict["person_id"] = pid
        }
        dict["device_type"] = EventDevice.ios.rawValue
        let event = ["event": dict]
        let data = NSKeyedArchiver.archivedData(withRootObject: event)
        
        let resource = Network.buildResource(path: path, method: .post, requestBody: data, queryItems: nil, headers: APIConstants.DefaultHeaders) { (data) -> [String: Any]? in
            // Response passing code block
            return [:]
        }
        
        Network.sendRequest(base: APIConstants.BasePath, resource: resource, failure: { (_, _, _) in
            // Failure code block
        }) { ([String: Any], _) in
            // Success code block
        }
    }
}
