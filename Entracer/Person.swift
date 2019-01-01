//
//  Person.swift
//  Entracer
//
//  Created by Tharindu Madushanka on 10/18/18.
//  Copyright © 2018 Entracer. All rights reserved.
//

import Foundation

/// Person types.
public enum PersonType: String {
    /// Lead type person.
    case Lead
    /// Converted lead.
    case Converted
}

/// Person status types.
public enum PersonStatus: String {
    /// New person.
    case New
    /// Validated person.
    case Validated
    /// Qualified person.
    case Qualified
    /// Rejected person.
    case Rejected
}

/**
 Model class to represent People objects, you may write extensions to add
 additional properties of person.
 */
open class Person: NSObject {
    
    /// Data dictionary.
    fileprivate var _data: NSMutableDictionary
    
    /**
     Initializes object with data dictionary.
    */
    public init(data: NSDictionary) {
        
        _data = NSMutableDictionary(dictionary: data)
    }
    
    /**
     Initializes object with empty data dictionary.
    */
    public override init() {
        
        _data = NSMutableDictionary.init()
    }
    
    /**
     Returns dictionary object representation of person
     
     - returns: Dictionary object.
    */
    public func dictionaryObject() -> NSMutableDictionary {
        return _data
    }
    
    /// Debuggable description of person.
    override open var description: String {
        return "<\(String(describing: Person.self)) Data: \(_data)>"
    }
    
    // MARK:- Properties
    
    /// Entracer id for person
    open var ident: String? {
        
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
    
    /// Person types could be `Lead`, `Converted`.
    open var type: String? {
        
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
    
    /// First name.
    open var first_name: String? {
        
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
    
    /// Last name.
    open var last_name: String? {
        
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
    
    /// Email address.
    open var email: String? {
        
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
    
    /// Mobile number.
    open var mobile: String? {
        
        get {
            if let object = _data.object(forKey: "mobile") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "mobile")
        }
    }
    
    /// Website url.
    open var website: String? {
        
        get {
            if let object = _data.object(forKey: "website") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "website")
        }
    }
    
    /// Person status can be `New`, `Validated`, `Qualified`, `Rejected`
    open var status: String? {
        
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
    
    /// Entracer tags for person.
    open var tags: [String]? {
        
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
    
    /// Department.
    open var department: [String]? {
        
        get {
            if let object = _data.object(forKey: "department") {
                return object as? [String]
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "department")
        }
    }
    
    /// Person title.
    open var title: [String]? {
        
        get {
            if let object = _data.object(forKey: "title") {
                return object as? [String]
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "title")
        }
    }
    
    /// Job title.
    open var job_title: [String]? {
        
        get {
            if let object = _data.object(forKey: "job_title") {
                return object as? [String]
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "job_title")
        }
    }
    
    /// Street 1 for address.
    open var street_1: String? {
        
        get {
            if let object = _data.object(forKey: "street_1") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "street_1")
        }
    }
    
    /// Street 2 for address.
    open var street_2: String? {
        
        get {
            if let object = _data.object(forKey: "street_2") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "street_2")
        }
    }
    
    /// City for address.
    open var city: String? {
        
        get {
            if let object = _data.object(forKey: "city") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "city")
        }
    }
    
    /// State for address.
    open var state: String? {
        
        get {
            if let object = _data.object(forKey: "state") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "state")
        }
    }
    
    /// Zip code for address.
    open var zip_code: String? {
        
        get {
            if let object = _data.object(forKey: "zip_code") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "zip_code")
        }
    }
    
    /// Country.
    open var country: String? {
        
        get {
            if let object = _data.object(forKey: "country") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "country")
        }
    }
}
