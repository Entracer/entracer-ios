//
//  Person.swift
//  Entracer
//
//  Created by Tharindu Madushanka on 10/18/18.
//  Copyright © 2018 Entracer. All rights reserved.
//

import Foundation

/**
 Model class to represent People objects, you may write extensions to read
 additional properties of person.
 */
public class Person: NSObject {
    
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
     Returns dictionary object representation of person
     
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
    
    var type: String? {
        
        get {
            if let object = _data.object(forKey: "type") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "type")
        }
    }
    
    var first_name: String? {
        
        get {
            if let object = _data.object(forKey: "first_name") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "first_name")
        }
    }
    
    var last_name: String? {
        
        get {
            if let object = _data.object(forKey: "last_name") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "last_name")
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
