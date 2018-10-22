//
//  Network.swift
//  Entracer
//
//  Created by Tharindu Madushanka on 10/10/18.
//  Copyright © 2018 Entracer. All rights reserved.
//

import Foundation

/// Struct for building urls with base url, path, and query items.
struct BasePath {
    
    
    static func buildURL(base: String, path: String, queryItems: [URLQueryItem]?) -> URL? {
        guard let url = URL(string: base) else {
            return nil
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.path = path
        components?.queryItems = queryItems
        return components?.url
    }
}

/// Request method types.
enum RequestMethod: String {
    case get
    case post
    case put
    case delete
}

/// The resource struct.
struct Resource<A> {
    let path: String
    let method: RequestMethod
    let requestBody: Data?
    let queryItems: [URLQueryItem]?
    let headers: [String:String]
    let parse: (Data) -> A?
}

/// Response error status types.
enum ErrorStatus {
    case parseError
    case noData
    case notOKStatusCode(statusCode: Int)
    case other(Error)
}

/// Network class for communicating with Entracer api.
open class Network {
    
    /**
     Sends network request for specific resource url.
     
     - parameter base: Base url for request.
     - parameter resource: Resource object.
     - parameter failure: A block to execute when request for resource fails.
     - parameter status: Response error status.
     - parameter data: Response data.
     - parameter response: Response object.
     - parameter success: A block to execute when request for resource succeeds.
     - parameter data: Parsed response data object.
     - parameter response: Response object.
    */
    class func sendRequest<A>(base: String,
                             resource: Resource<A>,
                             failure: @escaping (_ status: ErrorStatus, _ data: Data?,_ response: URLResponse?) -> (),
                             success: @escaping (_ data: A,_ response: URLResponse?) -> ()) {
        guard let request = buildURLRequest(base: base, resource: resource) else {
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) -> Void in
            guard let httpResponse = response as? HTTPURLResponse else {
                failure(.other(error!), data, response)
                return
            }
            guard httpResponse.statusCode == 200 else {
                failure(.notOKStatusCode(statusCode: httpResponse.statusCode), data, response)
                return
            }
            guard let responseData = data else {
                failure(.noData, data, response)
                return
            }
            guard let result = resource.parse(responseData) else {
                failure(.parseError, data, response)
                return
            }
            
            success(result, response)
            }.resume()
    }
    
    /**
     Builds a URL Request with base path and `Resource` object.
     
     - parameter base: Base url for request.
     - parameter resource: Resource object to build full url.
     
     - returns: Full url.
    */
    private class func buildURLRequest<A>(base: String, resource: Resource<A>) -> URLRequest? {
        guard let url = BasePath.buildURL(base: base,
                                          path: resource.path,
                                          queryItems: resource.queryItems) else {
                                            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = resource.method.rawValue
        request.httpBody = resource.requestBody
        
        for (header, value) in resource.headers {
            request.setValue(value, forHTTPHeaderField: header)
        }
        return request as URLRequest
    }
    
    /**
     Builds a Resource object to communicate with api.
     
     - parameter path: Request url path.
     - parameter method: Request method.
     - parameter requestBody: Request body data.
     - parameter queryItems: Request url query items.
     - parameter headers: Request headers.
     - parameter parse: A block to execute when required to parse response data, which returns parsed data.
     - parameter data: Data to be parsed.
     
     - returns: Resource object.
    */
    class func buildResource<A>(path: String,
                                method: RequestMethod,
                                requestBody: Data? = nil,
                                queryItems: [URLQueryItem]? = nil,
                                headers: [String: String],
                                parse: @escaping (_ data: Data) -> A?) -> Resource<A> {
        return Resource(path: path,
                        method: method,
                        requestBody: requestBody,
                        queryItems: queryItems,
                        headers: headers,
                        parse: parse)
    }
    
}
