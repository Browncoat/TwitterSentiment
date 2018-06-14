//
//  Constants.swift
//  TwitterSentiment
//
//  Created by Nate Potter on 6/12/18.
//  Copyright © 2018 Nate Potter. All rights reserved.
//

import Foundation

enum API: String {
    case apiEndpoint = "https://api.twitter.com"
    case requestTokenEndpoint = "https://api.twitter.com/oauth2/token"
    case consumerKey = "RngSc6XsGmVODtFXluhryjDhP"
    case consumerSecret = "WIkqNzjvWeNSYDIi56ao0I8hyHwa9NnZfANsxm7s9BlVDIxTiw"
    
    case userTimelineEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
}

