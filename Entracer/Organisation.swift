//
//  Organisation.swift
//  Entracer
//
//  Created by Tharindu Madushanka on 10/23/18.
//  Copyright © 2018 Entracer. All rights reserved.
//

import Foundation

/// Organisation status types.
public enum OrganisationStatus: String {
    case New
    case Active
    case Dormant
    case Blacklisted
}

/**
 Model class to represent Organisation objects, you may write extensions to add
 additional properties for organisation.
 */
public class Organisation: NSObject {
    
    fileprivate var _data: NSMutableDictionary
    
    /**
     Initializes object with data dictionary.
     */
    init(data: NSDictionary) {
        
        _data = NSMutableDictionary(dictionary: data)
    }
    
    /**
     Initializes object with empty data dictionary.
     */
    override init() {
        
        _data = NSMutableDictionary.init()
    }
    
    /**
     Returns dictionary object representation of organisation
     
     - returns: Dictionary object.
     */
    func dictionaryObject() -> NSMutableDictionary {
        return _data
    }
    
    /// Debuggable description of person.
    override public var description: String {
        return "<\(String(describing: self)) Data: \(_data)>"
    }
    
    // MARK:- Properties
    
    var ident: String? {
        
        get {
            if let object = _data.object(forKey: "id") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "id")
        }
    }
    
    var name: String? {
        
        get {
            if let object = _data.object(forKey: "name") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "name")
        }
    }
        
    var email: String? {
        
        get {
            if let object = _data.object(forKey: "email") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "email")
        }
    }
    
    var status: String? {
        
        get {
            if let object = _data.object(forKey: "status") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "status")
        }
    }
    
    var tags: [String]? {
        
        get {
            if let object = _data.object(forKey: "tags") {
                return object as? [String]
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "tags")
        }
    }
}
