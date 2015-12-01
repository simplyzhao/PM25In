//
//  Copyright © 2015 Alex Zhao. All rights reserved.
//

import Foundation

public class PM25In {
    // Singleton
    public static let sharedInstance = PM25In()
    private init() {
        print("PM25In initialized with API Key: \(self.apiKey)")
    }
    
    // Debug enable
    public static var debugEnabled = false
    
    // PM25.in API required fields
    private let apiKey: String = "5j1znBVAsnSf5xQyNQyq" // public testing-only API Key
    private static let apiFixedURL: String = "http://www.pm25.in/api/querys"
    private let session = NSURLSession.sharedSession()

    private func buildAPIRequestURL(request: Request) -> String {
        // build the API URL based on the request type and parameters
        var apiURL = PM25In.apiFixedURL
    
        apiURL += request.uniqueURLString
    
        if request.tokenRequired {
            apiURL += "?token=\(self.apiKey)"
        }
    
        if request.parametersString.isEmpty != true {
            apiURL += "&\(request.parametersString)"
        }
    
        return apiURL
    }
    
    public func sendRequest(request: Request, completion: (Response?, NSError?) -> Void) {
        
        let completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void = {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                if PM25In.debugEnabled {
                    print("PM25In --- receiving response[request(\(request.description()))]: " + String(data: data!, encoding: NSUTF8StringEncoding)!)
                }
                
                do {
                    let response = try request.parse(data!)
                    
                    completion(response, nil)
                } catch let error as NSError {
                    completion(nil, error)
                }
                
            } else {
                if PM25In.debugEnabled {
                    print("PM25In --- receiving error[request(\(request.description()))]: \(error)")
                }
                
                completion(nil, error)
            }
        }

        let apiURL = self.buildAPIRequestURL(request)
        
        if let url = NSURL(string: apiURL) {
            if PM25In.debugEnabled {
                print("PM25In --- sending request(\(request.description()))")
            }
            
            let task = session.dataTaskWithURL(url, completionHandler:completionHandler)
            task.resume()
        }
    }
}