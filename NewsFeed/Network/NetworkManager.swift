//
//  NetworkManager.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    let logger = LogService()
    private let apiKey = "b05aec4558f049bebc706f10846accfb"
    
    func createRequest<T: Decodable> (endPoint: String, apiMethod: HTTPMethod = .GET, params: [String: String]? = nil, body: Data? = nil, resultType: T.Type, completionHandler: @escaping(_ result: T) -> Void, onFailure: @escaping(_ error: ErrorModel) -> Void) {
        
        var requestURLStr = EnvironmentConstants.baseURL + "\(endPoint)?apiKey=\(apiKey)"
                
        if let params = params {
            requestURLStr = requestURLStr + getParamsFromDictionary(params: params)
        }
        
        guard let requestURL = URL(string: requestURLStr) else {
            onFailure(ErrorModel(message: StringConstants.invalidURL))
            return
        }
        
        var request = URLRequest(url: requestURL)
    
        if let body = body {
            request.httpBody = body
        }
        
        request.httpMethod = apiMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        request.timeoutInterval = 20000.0
        
        let requestUID = UUID().uuidString
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            self.logger.printRESTResponseLogs(uid: requestUID, method: apiMethod, url: requestURLStr, response: data, error: error)
            
            if let error = error as? URLError {
                onFailure(ErrorModel(message: error.localizedDescription))
                return
            }
            if let dataResponse = response {
                let urlResponse = dataResponse as? HTTPURLResponse
                let responseCode = urlResponse?.statusCode ?? 0
                switch responseCode {
                case 200...201:
                    if let data = data {
                        do {
                            let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                            completionHandler(decodedData)
                        } catch {
                            onFailure(ErrorModel(message: error.localizedDescription))
                        }
                    } else {
                        onFailure(ErrorModel(message: StringConstants.dataNotFound))
                    }
                case 401:
                    onFailure(ErrorModel(code: 401, message: error?.localizedDescription ?? StringConstants.unAuthorized))
                default:
                    onFailure(ErrorModel(code: responseCode, message: error?.localizedDescription ?? StringConstants.unAuthorized))
                }
            } else {
                onFailure(ErrorModel(message: StringConstants.unAuthorized))
            }
        }
        
        logger.printRESTRequestLogs(uid: requestUID, method: apiMethod, url: requestURLStr, params: params, body: body)
        
        task.resume()
        
    }
    
    private func getParamsFromDictionary(params: [String:String]) -> String {
        var urlStr = ""
        if params.count > 0 {
            for item in params {
                let key = item.key
                let value = item.value.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                if key != "" && value != "" {
                    if urlStr.last != "?" {
                        urlStr = urlStr + "&"
                    }
                    urlStr = urlStr + "\(key)=\(value ?? "")"
                }
            }
        }
        return urlStr
        
    }
}
