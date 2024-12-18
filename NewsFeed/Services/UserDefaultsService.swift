//
//  UserDefaultsService.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

struct UserDefaultsService {
    
    static func saveValue(_ value: String, forKey key: String) {
        let database = UserDefaults.standard
        let encodedKey = encode(str: key) ?? key
        let encodedValue = encode(str: value)
        database.set(encodedValue, forKey: encodedKey)
        database.synchronize()
    }
    
    static func getValue(forKey key: String) -> String {
        let database = UserDefaults.standard
        let encodedKey = encode(str: key) ?? key
        return decode(str: database.value(forKey: encodedKey) as? String ?? "") ?? ""
    }
    
    static func removeObject(forKey key: String) {
        let database = UserDefaults.standard
        let encodedKey = encode(str: key) ?? key
        database.removeObject(forKey: encodedKey)
        database.synchronize()
    }
    
    //Encode
    static func encode(str: String) -> String?{
        return Data(str.utf8).base64EncodedString()
    }
    
    //Decode
    static func decode(str: String) -> String? {
        let data = Data(base64Encoded: str, options: .ignoreUnknownCharacters)
        if data != nil {
            return String(data: data!, encoding: .utf8)
        }
        return nil
    }
}
