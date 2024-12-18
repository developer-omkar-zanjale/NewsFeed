//
//  LogService.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

class LogService {
    
    let spacer = "\n \n"
    
    func printRESTRequestLogs(uid: String, method: HTTPMethod, url: String, params: [String:String]?, body: Data?) {
        
        printLog(spacer)
        printLog("REQUEST------------------------------>>")
        
        printLog("UID: \(uid)")
        
        printLog("Method: \(method)")
        
        printLog("Path:\n    \(url)")
        printLog(spacer)
        
        if let params = params {
            printLog("Params:\n    \(params)")
            printLog(spacer)
        }
        
        
        if let body = body {
            let request = nsdataToJSON(data: body)
            if let request = request {
                printLog("Body:\n    \(request)")
                printLog(spacer)
            }
        }
        
    }
    
    func printRESTResponseLogs(uid: String, method: HTTPMethod, url: String, response: Data?, error: Error?) {
        
        printLog(spacer)
        printLog("<<------------------------------RESPONSE")
        
        printLog("UID: \(uid)")
        
        printLog("Method: \(method)")
        
        printLog("Path:\n    \(url)")
        
        if let response = nsdataToJSON(data: response) {
            printLog("Response:\n\(response)")
            printLog(spacer)
        }
        
        if let error = error {
            printLog("Error:\n \(error)")
            printLog(spacer)
        }
        
    }
    
}
