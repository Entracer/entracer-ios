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
open class Organisation: NSObject {
    
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
     Returns dictionary object representation of organisation
     
     - returns: Dictionary object.
     */
    public func dictionaryObject() -> NSMutableDictionary {
        return _data
    }
    
    /// Debuggable description of person.
    override open var description: String {
        return "<\(String(describing: Organisation.self)) Data: \(_data)>"
    }
    
    // MARK:- Properties
    
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
    
    open var name: String? {
        
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
    
    open var phone: String? {
        
        get {
            if let object = _data.object(forKey: "phone") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "phone")
        }
    }
    
    open var fax: String? {
        
        get {
            if let object = _data.object(forKey: "fax") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "fax")
        }
    }
    
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
    
    open var billing_street_1: String? {
        
        get {
            if let object = _data.object(forKey: "billing_street_1") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "billing_street_1")
        }
    }
    
    open var billing_street_2: String? {
        
        get {
            if let object = _data.object(forKey: "billing_street_2") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "billing_street_2")
        }
    }
    
    open var billing_city: String? {
        
        get {
            if let object = _data.object(forKey: "billing_city") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "billing_city")
        }
    }
    
    open var billing_state: String? {
        
        get {
            if let object = _data.object(forKey: "billing_state") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "billing_state")
        }
    }
    
    open var billing_zip_code: String? {
        
        get {
            if let object = _data.object(forKey: "billing_zip_code") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "billing_zip_code")
        }
    }
    
    open var billing_country: String? {
        
        get {
            if let object = _data.object(forKey: "billing_country") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "billing_country")
        }
    }
    
    open var shipping_street_1: String? {
        
        get {
            if let object = _data.object(forKey: "shipping_street_1") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "shipping_street_1")
        }
    }
    
    open var shipping_street_2: String? {
        
        get {
            if let object = _data.object(forKey: "shipping_street_2") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "shipping_street_2")
        }
    }
    
    open var shipping_city: String? {
        
        get {
            if let object = _data.object(forKey: "shipping_city") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "shipping_city")
        }
    }
    
    open var shipping_state: String? {
        
        get {
            if let object = _data.object(forKey: "shipping_state") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "shipping_state")
        }
    }
    
    open var shipping_zip_code: String? {
        
        get {
            if let object = _data.object(forKey: "shipping_zip_code") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "shipping_zip_code")
        }
    }
    
    open var shipping_country: String? {
        
        get {
            if let object = _data.object(forKey: "shipping_country") as? String {
                return object
            } else {
                return nil
            }
        }
        
        set {
            _data.setValue(newValue, forKey: "shipping_country")
        }
    }
}
