//
//  TwitterApplicationOnlyService.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/13/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

import Foundation

class TwitterApplicationOnlyService {
    var session: URLSession?
    
    required init(completion: @escaping (TwitterApplicationOnlyService?)->()) {
        getAccessToken { [weak self] accessToken in
            if let accessToken = accessToken {
                let config = URLSessionConfiguration.default
                config.httpAdditionalHeaders = ["Authorization" : "Bearer \(accessToken)",
                                                "Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"]
                
                self?.session = URLSession(configuration: config)
                
                completion(self)
            } else {
                completion(nil)
            }
        }
    }
    
    func getTweetsForUser(_ username: String = "twitterapi", count: Int = 1, completion: @escaping ([Tweet])->()) {
        guard let session = session else {
            print("No session")
            return
        }
        
        let url = URL(string: "\(API.userTimelineEndpoint.rawValue)?\(count)&screen_name=\(username)")
        let request = URLRequest(url: url!)
        
        let task = session.dataTask(with: request) { [completion] (data, response, error) -> Void in
            guard let data = data else {
                fatalError("Unable to retrieve tweets")
            }
            
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let decoder = JSONDecoder()
                let tweets = try! decoder.decode([Tweet].self, from: data)
                
                completion(tweets)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

// MARK: Get Access Token
extension TwitterApplicationOnlyService {
    func getAccessToken(completion: @escaping (String?)->()) {
        guard let url = URL(string: API.requestTokenEndpoint.rawValue) else {
            fatalError("incorrect request token endpoint")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "grant_type=client_credentials".data(using: .utf8)
        
        let config = URLSessionConfiguration.default
        let userPasswordString = "\(Keys.consumerKey.rawValue):\(Keys.consumerSecret.rawValue)"
        let userPasswordData = userPasswordString.data(using: String.Encoding.utf8)
        let base64EncodedCredential = userPasswordData!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        let authString = "Basic \(base64EncodedCredential)"
        config.httpAdditionalHeaders = ["Authorization" : authString,
                                        "Content-Type" : "application/x-www-form-urlencoded;charset=UTF-8"]
        
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { [weak self] (data, response, error) -> Void in
            guard let data = data else {
                fatalError("Unable to retrieve access token")
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let json = json as? [String: String], let accessToken = json["access_token"] {
                    completion(accessToken)
                } else {
                    print("Unable to parse access token response")
                    completion(nil)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
