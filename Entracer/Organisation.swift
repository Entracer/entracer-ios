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
    /// New organisation.
    case New
    /// Active organisation.
    case Active
    /// Dormant organisation.
    case Dormant
    /// Blacklisted organisation.
    case Blacklisted
}

/**
 Model class to represent Organisation objects, you may write extensions to add
 additional properties for organisation.
 */
open class Organisation: NSObject {
    
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
    
    /// Entracer id for organisation.
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
    
    /// Organisation name.
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
    
    /// Phone number.
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
    
    /// Fax number.
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
    
    /// Organisation status could be `New`, `Active`, `Dormant`, `Blacklisted`.
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
    
    /// Entracer tags for organisation.
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
    
    /// Street 1 for billing address.
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
    
    /// Street 2 for billing address.
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
    
    /// City for billing address.
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
    
    /// State for billing address.
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
    
    /// Zip code for billing address.
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
    
    /// Country for billing address.
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
    
    /// Street 1 for shipping address.
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
    
    /// Street 2 for shipping address.
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
    
    /// City for shipping address.
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
    
    /// State for shipping address.
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
    
    /// Zip code for shipping address.
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
    
    /// Country for shipping address.
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
