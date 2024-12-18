//
//  CommonFunctions.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import SwiftUI


//MARK: Public Functions
func printLog(_ log: String) {
    if EnvironmentConstants.currentEnvironment != .PROD {
        print(log)
    }
}

func asyncQueue(completion: @escaping(()->())) {
    DispatchQueue.main.async {
        completion()
    }
}

func asyncAfter(_ sec: Double = 1, completion: @escaping(()->())) {
    DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
        completion()
    }
}

//MARK: Conversions
func nsdataToJSON(data: Data?) -> AnyObject? {
    
    guard let data = data else {
        return nil
    }
    
    do {
        return try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as AnyObject
    } catch let myJSONError {
        printLog("\(myJSONError)")
    }
    return nil
}

func decodeResponse<T:BaseResponse>(data: Data, type: T.Type) -> T? {
    
    var response:T?
    do {
        response = try JSONDecoder().decode(T.self, from: data)
    } catch {
        printLog("\(error.localizedDescription)")
    }
    
    return response
    
}


func getFontSizeByWidth(pixels : Int)->CGFloat{
    
    let pixels = pixels
    
    switch(pixels){
        
    case 8 :
        return UIScreen.main.bounds.width / 38
        
    case 10 :
        return UIScreen.main.bounds.width / 36
        
    case 12 :
        return UIScreen.main.bounds.width / 30.5
        
    case 14 :
        return UIScreen.main.bounds.width / 29
        
    case 16 :
        return UIScreen.main.bounds.width / 24
        
    case 18 :
        return UIScreen.main.bounds.width / 23
        
    case 20 :
        return UIScreen.main.bounds.width / 20
        
    case 21 :
        return UIScreen.main.bounds.width / 19.5
        
    case 24 :
        return UIScreen.main.bounds.width / 18
        
    case 26 :
        return UIScreen.main.bounds.width / 16
        
    case 28 :
        return UIScreen.main.bounds.width / 14
        
    case 30 :
        return UIScreen.main.bounds.width / 12
        
    case 32 :
        return UIScreen.main.bounds.width / 10
        
    default:
       return UIScreen.main.bounds.width / 25
    }
    
}
