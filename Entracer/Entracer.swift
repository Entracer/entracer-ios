//
//  Entracer.swift
//  Entracer
//
//  Created by Tharindu Madushanka on 10/10/18.
//  Copyright © 2018 Entracer. All rights reserved.
//

import Foundation

/// Main class for integrating Entracer with your app.
open class Entracer {
    
    /// The singleton `Entracer` instance.
    static let instance = Entracer()
    
    /// Entracer API token.
    var apiToken = ""
    
    /// Entracer API base path.
    var apiBasePath = APIConstants.BasePath
    
    /// Person identifier.
    var personID = ""
    
    /// Organisation identifier.
    var organisationID = ""
    
    /// Private initializer.
    private init() {
        Logger.addLogger(delegate: PrintLogger())
    }
    
    /**
     Configures Entracer shared instance with API token.
     
     - parameter token: Entracer API token to communicate.
     - parameter basePath: Optional API base path. Useful to call a custom Entracer end point.
     */
    open class func configure(token apiToken: String, basePath: String? = nil) {
        
        Entracer.instance.apiToken = apiToken
        if let base = basePath {
            Entracer.instance.apiBasePath = base
        }
        Logger.info(text: "Configured with api token: \(apiToken)")
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
        entracer.apiBasePath = APIConstants.BasePath
        entracer.personID = ""
        entracer.organisationID = ""
        Logger.debug(text: "Reseted entracer values")
    }
    
    /**
     Triggers an event. A person or organisation can be specified optionally.
     
     - note: If person identity is specified, organisation identity is ignored.
     
     - parameter event: Event identifier name.
     - parameter personID: Optional person id.
     - parameter organisationID: Optional organisation id.
     - parameter channel: Optional channel name.
    */
    open func trigger(event: String, personID: String?, organisationID: String?, channel: String?) {
        
        guard apiToken != "" else {
            // API token not set
            Logger.warning(text: "API Token not set!")
            return
        }
        
        let path = APIConstants.Version + EndPoints.events.rawValue + event + EndPoints.trigger.rawValue
        var dict = [String: Any]()
        if let pid = personID {
            dict["person_id"] = pid
        } else if let oid = organisationID {
            dict["organisation_id"] = oid
        }
        if let ch = channel {
            dict["channel"] = ch
        }
        dict["device_type"] = EventDevice.ios.rawValue
        let event = ["event": dict]
        let data = NSKeyedArchiver.archivedData(withRootObject: event)
        
        let resource = Network.buildResource(path: path, method: .post, requestBody: data, queryItems: nil, headers: APIConstants.DefaultHeaders) { (data) -> [String: Any]? in
            // Response passing code block
            do {
                let json = try JSON.init(with: data)
                if let dict = json.dictionary {
                    Logger.debug(text: "Event triggered with response:\(dict)")
                    return dict
                } else {
                    Logger.debug(text: "Event trigger unexpected response.")
                }
            } catch {
                Logger.error(text: "Event trigger invalid response!")
                return [:]
            }
            return [:]
        }
        
        Network.sendRequest(base: Entracer.instance.apiBasePath, resource: resource, failure: { (status, _, _) in
            // Failure code block
            Logger.error(text: "Failed trigger Event request with error status:\(status)")
        }) { ([String: Any], _) in
            // Success code block
            Logger.debug(text: "Event triggered successfully.")
            return
        }
    }
    
    /**
     Creates or updates existing Entracer person entry with email,
     and returns the person identifier for reference. Function will also
     update `personID` variable for Entracer instance.
     
     - note: Select person or organisation based on your requirement.
     
     - parameter person: `Person` object with data.
    */
    open func createOrUpdate(person: Person) {
        
        guard apiToken != "" else {
            // API token not set
            Logger.warning(text: "API Token not set!")
            return
        }
        
        let path = APIConstants.Version + EndPoints.people.rawValue + EndPaths.createOrUpdate.rawValue
        
        let person = ["person": person.dictionaryObject()]
        let data = NSKeyedArchiver.archivedData(withRootObject: person)
        
        let resource = Network.buildResource(path: path, method: .post, requestBody: data, queryItems: nil, headers: APIConstants.DefaultHeaders) { (data) -> [String: Any]? in
            // Parse response to read person id
            do {
                let json = try JSON.init(with: data)
                if let dict = json.dictionary {
                    let pn = Person.init(data: dict as NSDictionary)
                    Entracer.instance.personID = pn.ident!
                    Logger.debug(text: "Person created or updated: \(pn)")
                } else {
                    Logger.debug(text: "Person create or update unexpected response.")
                }
            } catch {
                Logger.error(text: "Person create or update invalid response!")
                return [:]
            }
            return [:]
        }
        
        Network.sendRequest(base: Entracer.instance.apiBasePath, resource: resource, failure: { (status, _, _) in
            // Failure code block
            Logger.error(text: "Failed create or update Person request with error status:\(status)")
        }) { ([String: Any], _) in
            // Success code block
            Logger.debug(text: "Person created or updated successfully.")
            return
        }
    }
    
    /**
     Creates or updates existing Entracer organisation entry with email,
     and returns the organisation identifier for reference. Function will also
     update `organisationID` variable for Entracer instance.
     
     - note: Select organisation or person based on your requirement.
     
     - parameter organisation: `Organisation` object with data.
     */
    open func createOrUpdate(organisation: Organisation) {
        
        guard apiToken != "" else {
            // API token not set
            Logger.warning(text: "API Token not set!")
            return
        }
        
        let path = APIConstants.Version + EndPoints.organisations.rawValue + EndPaths.createOrUpdate.rawValue
        
        let person = ["organisation": organisation.dictionaryObject()]
        let data = NSKeyedArchiver.archivedData(withRootObject: person)
        
        let resource = Network.buildResource(path: path, method: .post, requestBody: data, queryItems: nil, headers: APIConstants.DefaultHeaders) { (data) -> [String: Any]? in
            // Parse response to read organisation id
            do {
                let json = try JSON.init(with: data)
                if let dict = json.dictionary {
                    let org = Organisation.init(data: dict as NSDictionary)
                    Entracer.instance.organisationID = org.ident!
                    Logger.debug(text: "Organisation created or updated: \(org)")
                } else {
                    Logger.debug(text: "Organisation create or update unexpected response.")
                }
            } catch {
                Logger.error(text: "Organisation create or update invalid response!")
                return [:]
            }
            return [:]
        }
        
        Network.sendRequest(base: Entracer.instance.apiBasePath, resource: resource, failure: { (status, _, _) in
            // Failure code block
            Logger.error(text: "Failed create or update Organisation request with error status:\(status)")
        }) { ([String: Any], _) in
            // Success code block
            Logger.debug(text: "Organisation created or updated successfully.")
            return
        }
    }
}
