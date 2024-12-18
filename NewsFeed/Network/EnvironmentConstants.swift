//
//  EnvironmentConstants.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

enum EnvironmentConstants {
    
    static let currentEnvironment: Environments = {
        var vr = UserDefaultsService.getValue(forKey: UserDefaultConstants.envType)
        if vr.isEmpty {
            vr = "PROD"
        }
                
        var env : Environments = .PROD
        
        if vr == "PROD" {
            env = .PROD
        }
        
        if vr == "DEV" {
            env = .DEV
        }
        
        if vr == "QA" {
            env = .QA
        }
        
        if vr == "STAGE" {
            env = .STAGE
        }
        
        return env
    }()
    
    static let networkProtocol : ConnectionType = .secure
    
    static let dataPopulation : DataPopulation = .DYNAMIC
    
    static let baseURL: String = {
        var returnURL = "newsapi.org/v2/"
        switch currentEnvironment {
        case .PROD:
            returnURL = "newsapi.org/v2/"
        case .DEV:
            returnURL = "newsapi.org/v2/"
        case .QA:
            returnURL = "newsapi.org/v2/"
        case .STAGE:
            returnURL = "newsapi.org/v2/"
        }
        return networkProtocol.rawValue + returnURL
    }()
    
}
